use crate::constants::{
    get_pointer_mapping, BASE_TEMP_SEGMENT, POP_A, POP_B, PUSH_A, PUSH_STR, SP_A, SP_AM, VM_COMMENT,
};
use crate::parser::{ArgumentPair, CommandType};
use std::path::Path;
use std::u128;
use std::{fs::File, io::Write, path};

// OpenOptions::new()
//             .append(true)
//             .create(true)
//             // .truncate(true)
//             .open(output_file)

pub struct CodeWriter {
    translated_assembly_file_handle: File,
    output_file_path: path::PathBuf,
    // shous currently parsing file
    current_file_name: String,
    // pointer to note depth of jump statement
    // NOTE: Never read directly, use helper function `generate_depth`
    jump_depth: usize,
}

// fn get_pointer_keywords() -> Keys<&'static str, &'static str> {
//     POINTER_MAPPINGS.keys()
// }

impl CodeWriter {
    pub fn new(output_file: &Path) -> CodeWriter {
        let mut code_writer = CodeWriter {
            translated_assembly_file_handle: File::create(output_file)
                .unwrap_or_else(|_| panic!("Couldn't write to {:?}!", output_file)),
            // NOTE: was necessary when I was using str for output_file
            output_file_path: path::Path::new(output_file).to_path_buf(),
            current_file_name: output_file
                .file_stem()
                .unwrap()
                .to_str()
                .unwrap()
                .to_string(),
            jump_depth: 0,
        };
        code_writer.write_to_file(&Self::generate_bootstrap_code(), Some(VM_COMMENT));
        code_writer
    }

    /// Helper functions
    fn generate_comment(command: &str) -> String {
        format!("// ----: {} ----\n", command)
    }

    // static file handling
    fn generate_static_mapper(&self, index: u128) -> String {
        format!(
            "{}.{}",
            self.output_file_path.file_stem().unwrap().to_str().unwrap(),
            index
        )
    }

    // helper function to generate new depth
    fn generate_depth(&mut self) -> usize {
        self.jump_depth += 1;
        self.jump_depth
    }

    // fn generate_extend_base(bp: &str, index: u128) -> String {
    //     format!("@{bp}\nD=A\n@{index}\nA=D+A")
    // }

    // so extends an address by an index
    fn generate_extend_address(bp: &str, index: u128) -> String {
        format!("@{bp}\nD=M\n@{index}\nD=A+D")
    }

    fn generate_jump_address(bp: &str, index: u128) -> String {
        format!("{}\n@R15\nM=D", Self::generate_extend_address(bp, index))
    }

    fn generate_push(bp: &str, index: u128) -> String {
        let base_pointer = get_pointer_mapping(bp).unwrap_or(&"--**-- Error");
        format!(
            "{}\nA=D\nD=M\n{PUSH_STR}",
            Self::generate_extend_address(base_pointer, index)
        )
    }

    // bootstrap code; SP=256;call Sys.init
    fn generate_bootstrap_code() -> String {
        format!("@{SP_AM}\nD=A\n@{SP_A}\nM=D\n@Sys.init\n0;JMP\n")
    }

    fn generate_goto(label: &str) -> String {
        format!("@{label}\n0;JMP\n")
    }

    pub fn set_file_name(&mut self, current_file_name: &str) {
        self.current_file_name = String::from(current_file_name);
        self.write_to_file("// ** New file init: {}", Some(VM_COMMENT));
    }

    /// Writes write-arithmetic instruction
    /// # Panics
    /// Invalid arithmetic instruction can't be translated
    pub fn write_arithmetic(&mut self, raw_command: Option<&str>, command_type: CommandType) {
        self.write_to_file("// Arithmetic-logic ", raw_command);
        // pop A to R13
        self.write_push_pop(
            None,
            CommandType::C_POP(ArgumentPair {
                first: POP_A.to_string(),
                second: 0,
            }),
            POP_A,
            0,
        );
        match command_type.clone() {
            CommandType::C_ARITHMETIC(command) => {
                let arith_logic_statement = match command.as_str() {
                    "not" | "neg" => {
                        // Write R15
                        format!(
                            "// (${})\n@R15\nM={}D",
                            command.as_str(),
                            if command.as_str() == "not" { "!" } else { "-" }
                        )
                    }
                    "lt" | "gt" | "eq" => {
                        let instance_depth = self.generate_depth();
                        format!(
                            "
                                // ($--logic-section)\n@{}\nD=M\n@SP\nA=M-1\nD=M-D\n@SP\nM=M-1
                                //(${})\n@TRUE_{instance_depth}\nD;J{}\n@{}\nM=0\n@CONTINUE_{}\n0;JMP\n(TRUE_{instance_depth})\n@{}\nM=-1\n(CONTINUE_{})
                            ",
                            POP_A,
                            command.as_str(),
                            command.as_str().to_uppercase(),
                            PUSH_A,
                            instance_depth,
                            PUSH_A,
                            instance_depth
                        )
                    }
                    arithmetic_instr => {
                        // pop B to R14
                        self.write_push_pop(
                            None,
                            CommandType::C_POP(ArgumentPair {
                                first: POP_B.to_string(),
                                second: 0,
                            }),
                            POP_B,
                            0,
                        );
                        format!(
                            "// (${})\n@{}\nD=M\n@{}\nD=M{}D\n@{}\nM=D",
                            arithmetic_instr,
                            POP_A,
                            POP_B,
                            // operator; todo: use constants instead
                            match arithmetic_instr {
                                "add" => "+",
                                "sub" => "-",
                                "and" => "&",
                                "or" => "|",
                                _ => panic!("{}: Code not found", arithmetic_instr),
                            },
                            PUSH_A,
                        )
                    }
                };
                self.write_to_file(arith_logic_statement.as_str(), None);
            }
            _ => panic!("Cannot perform arith-logic on non-arith-logic instruction"),
        };

        // push to A
        self.write_push_pop(
            None,
            CommandType::C_PUSH(ArgumentPair {
                first: PUSH_A.to_string(),
                second: 0,
            }),
            PUSH_A,
            0,
        );
    }

    /// Writes push-pop instruction to stack
    /// # Panics
    /// Don't call if CommandType isn't C_PUSH or C_POP
    pub fn write_push_pop(
        &mut self,
        raw_command: Option<&str>,
        command: CommandType,
        segment: &str,
        index: u128,
    ) {
        let translation = match command {
            CommandType::C_PUSH(_) => match segment {
                base_pointer if matches!(base_pointer, "local" | "argument" | "this" | "that") => {
                    Self::generate_push(base_pointer, index)
                }
                "pointer" => {
                    format!(
                        "@{}\nD=M\n{PUSH_STR}",
                        if index == 0 { "THIS" } else { "THAT" }
                    )
                }
                "constant" => {
                    format!("@{index}\nD=A\n{PUSH_STR}")
                }
                "temp" => {
                    format!("@{}\nD=M\n{PUSH_STR}", BASE_TEMP_SEGMENT + index)
                }
                "static" => {
                    format!("@{}\nD=M\n{PUSH_STR}", self.generate_static_mapper(index))
                }
                _ => format!("@{segment}\nD=M\n{PUSH_STR}"),
            },
            CommandType::C_POP(_) => {
                format!(
                    "{}\n@SP\nM=M-1\nA=M\nD=M\n{}\nM=D",
                    match segment {
                        "temp" | "R13" | "R14" | "R15" | "pointer" | "static" => "".to_string(),
                        _ => {
                            let segment_keyword =
                                get_pointer_mapping(segment).expect("Unrecognized segment");
                            Self::generate_jump_address(segment_keyword, index)
                        }
                    },
                    match segment {
                        "temp" => format!("@{}", BASE_TEMP_SEGMENT + index),
                        "R13" | "R14" | "R15" => format!("@{segment}"),
                        "pointer" => format!("@{}", if index == 0 { "THIS" } else { "THAT" }),
                        "static" => format!("@{}", self.generate_static_mapper(index)),
                        _ => "@R15\nA=M".to_string(),
                    }
                )
            }
            _ => panic!("Can't push/pop if instruction isn't a push/pop instruction"),
        };
        self.write_to_file(translation.as_str(), raw_command);
    }

    pub fn write_label(&mut self, label: &str) {
        self.write_to_file(
            format!("({label})").as_str(),
            Some(format!("label: {label}").as_str()),
        )
    }

    pub fn write_goto(&mut self, label: &str) {
        self.write_to_file(
            format!("@{label}\n0;JMP\n").as_str(),
            Some(format!("-> Goto - {label}").as_str()),
        )
    }

    pub fn write_if(&mut self, label: &str) {
        self.write_to_file(
            format!("@SP\nM=M-1\nA=M\nD=M\n@{label}\nD;JGT\n").as_str(),
            Some(format!("?-> If Goto - {label}").as_str()),
        )
    }

    pub fn write_function(&mut self, function_name: &str, n_vars: u128) {
        // handles function generator
        self.write_to_file(
            format!("({}.{})\n", self.current_file_name, function_name).as_str(),
            Some(format!("Function init - {}", function_name).as_str()),
        );

        // push 0 to local N_VARS times
        for i in 0..n_vars {
            self.write_to_file(
                format!("{}\nA=D\n@0\n", Self::generate_extend_address("local", i)).as_str(),
                Some(format!("% func: {function_name}-{n_vars}").as_str()),
            )
            // self.write_push_pop(
            //     None,
            //     CommandType::C_PUSH(ArgumentPair {
            //         first: "".to_string(),
            //         second: 0,
            //     }),
            //     "local",
            //     i.into(),
            // );
        }
    }

    pub fn write_call() {
        todo!()
    }

    pub fn write_return() {
        todo!()
    }

    fn write_to_file(&mut self, translation: &str, vm_command: Option<&str>) {
        let total_translation = if let Some(vm_command_str) = vm_command {
            format!(
                "{}{}\n",
                Self::generate_comment(vm_command_str),
                translation
            )
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
            self.output_file_path
                .file_name()
                .expect("Filename not found!")
        );
    }
}
