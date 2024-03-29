use std::{fs::File, io::Write, path};
use crate::parser::{ArgumentPair, CommandType};
use crate::constants::{
    get_pointer_mapping, BASE_TEMP_SEGMENT, PUSH_A, POP_A, POP_B, PUSH_STR
};

// OpenOptions::new()
//             .append(true)
//             .create(true)
//             // .truncate(true)
//             .open(output_file)

pub struct CodeWriter {
    translated_assembly_file_handle: File,
    output_file_path: path::PathBuf,
}


// fn get_pointer_keywords() -> Keys<&'static str, &'static str> {
//     POINTER_MAPPINGS.keys()
// }

impl CodeWriter {
    pub fn new(output_file: &str) -> CodeWriter {
        CodeWriter {
            translated_assembly_file_handle: File::create(output_file)
                .unwrap_or_else(|_| panic!("Couldn't write to {}!", output_file)),
            output_file_path: path::Path::new(output_file).to_path_buf(),
        }
    }

    /// Helper functions
    fn generate_comment(command: &str) -> String {
        format!("// ----: {} ----\n", command)
    }

    // fn generate_extend_base(bp: &str, index: u128) -> String {
    //     format!("@{bp}\nD=A\n@{index}\nA=D+A")
    // }

    fn generate_extend_address(bp: &str, index: u128) -> String {
        format!("@{bp}\nD=M\n@{index}\nA=D+A")
    }

    fn generate_push(bp: &str, index: u128) -> String {
        let base_pointer = get_pointer_mapping(bp)
            .unwrap_or(&"--**-- Error");
        format!("{}\nD=M\n{PUSH_STR}", Self::generate_extend_address(base_pointer, index))
    }

    /// Writes write-arithmetic instruction
    /// # Panics
    /// Invalid arithmetic instruction can't be translated
    pub fn write_arithmetic(&mut self, raw_command: Option<&str>, command_type: CommandType) {
        self.write_to_file("// Arithmetic-logic ", raw_command);
        // pop A to R13
        self.write_push_pop(
            None,
            CommandType::C_POP(ArgumentPair { first: POP_A.to_string(), second: 0 }),
            POP_A,
            0,
        );
        match command_type.clone() {
            CommandType::C_ARITHMETIC(command) => {
                let arith_logic_statement = match command.as_str() {
                    "not" | "neg" => {
                        // Write R15
                        format!("// (${})\n@R15\nM={}D", command.as_str(), if command.as_str() == "not" { "!" } else { "-" })
                    }
                    "lt" | "gt" | "eq" => {
                        format!(
                            "// (${})\n@{}\nD=M\n@{}\nD=D-M\n@(TRUE)\nD;J{}\n@R15\nM=0\n(TRUE)\n@R15\nM=-1",
                            command.as_str(),
                            POP_A, POP_B,
                            command.as_str().to_uppercase()
                        )
                    }
                    arithmetic_instr => {
                        // pop B to R14
                        self.write_push_pop(
                            None,
                            CommandType::C_POP(ArgumentPair { first: POP_B.to_string(), second: 0 }),
                            POP_B,
                            0,
                        );
                        format!(
                            "// (${})\n@{}\nD=M\n@{}\nD=D{}M\n@{}\nM=D",
                            arithmetic_instr,
                            POP_A, POP_B,
                            // operator; todo: use constants instead
                            match arithmetic_instr {
                                "add" => "+",
                                "sub" => "-",
                                "and" => "&",
                                "or" => "|",
                                _ => panic!("{}: Code not found", arithmetic_instr)
                            },
                            PUSH_A,
                        )
                    }
                };
                self.write_to_file(arith_logic_statement.as_str(), None);
            }
            _ => panic!("Cannot perform arith-logic on non-arith-logic instruction")
        };

        // push to A
        self.write_push_pop(
            None,
            CommandType::C_PUSH(ArgumentPair { first: PUSH_A.to_string(), second: 0 }),
            PUSH_A,
            0,
        );
    }

    /// Writes push-pop instruction
    /// # Panics
    /// Don't call if CommandType isn't C_PUSH or C_POP
    pub fn write_push_pop(
        &mut self,
        raw_command: Option<&str>,
        command: CommandType, segment: &str,
        index: u128,
    ) {
        let translation = match command {
            CommandType::C_PUSH(_) => {
                match segment {
                    base_pointer
                    if matches!(base_pointer, "local" | "argument" | "this" | "that") =>
                        Self::generate_push(base_pointer, index),
                    "pointer" => {
                        format!("@{}\nD=M\n{PUSH_STR}", if index == 0 { "THIS" } else { "THAT" })
                    }
                    "constant" => {
                        format!("@{index}\nD=A\n{PUSH_STR}")
                    }
                    "temp" => {
                        format!("@{}\nD=M\n{PUSH_STR}", BASE_TEMP_SEGMENT + index)
                    }
                    _ => format!("@{segment}\nD=M\n{PUSH_STR}")
                }
            }
            CommandType::C_POP(_) => {
                format!(
                    "@SP\nA=M-1\nD=M\n@SP\nM=M-1\n{}\nM=D",
                    match segment {
                        "temp" => format!("@{}", (BASE_TEMP_SEGMENT + index)),
                        "R13" | "R14" | "R15" => format!("@{segment}"),
                        _ => {
                            let segment_keyword = get_pointer_mapping(segment).expect("Unrecognized segment");
                            Self::generate_extend_address(segment_keyword, index).to_string()
                        }
                    }
                )
            }
            _ => panic!("Can't push/pop if instruction isn't a push/pop instruction")
        };
        self.write_to_file(translation.as_str(), raw_command);
    }

    fn write_to_file(&mut self, translation: &str, vm_command: Option<&str>) {
        let total_translation = if let Some(vm_command_str) = vm_command {
            format!("{}{}\n", Self::generate_comment(vm_command_str), translation)
        } else {
            format!("{}\n", translation)
        };
        self.translated_assembly_file_handle
            .write_all(total_translation.as_bytes())
            .expect("Couldn't write translation to output file");
    }
}

impl Drop for CodeWriter {
    fn drop(&mut self) {
        self.write_to_file(
            "\n// Infinite end loop\n(END)\n@END\n0;JMP\n\n// CC=X\n// V=1.0.0",
            None,
        );
        // drop(self.translated_assembly_file_handle);
        println!(
            "Assembly file written to {:?}",
            self.output_file_path.file_name()
        );
        // todo!("Infinite loop code generation")
    }
}
