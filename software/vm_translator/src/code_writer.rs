use std::{fs::File, io::Write, path};
use std::fmt::format;
use phf;
use crate::parser::CommandType;

// OpenOptions::new()
//             .append(true)
//             .create(true)
//             // .truncate(true)
//             .open(output_file)

pub struct CodeWriter {
    translated_assembly_file_handle: File,
    output_file_path: path::PathBuf,
}


/// Standard constants
const PUSH_STR: &str = "@SP\nA=M\nM=D\n@SP\nM=M+1";
const BASE_TEMP_SEGMENT: u128 = 5;


static POINTER_MAPPINGS: phf::Map<&'static str, &'static str> = phf::phf_map! {
    "local" => "LCL",
    "argument" => "ARG",
    "this" => "THIS",
    "that" => "THAT"
};

fn get_pointer_mapping(raw_kw: &str) -> Result<&&str, &str> {
    POINTER_MAPPINGS.get(raw_kw).ok_or("Not found")
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

    fn generate_push(bp: &str, index: u128) -> String {
        let base_pointer = get_pointer_mapping(bp)
            .unwrap_or(&"--**-- Error");
        format!("@{base_pointer}\nA=M+{index}\nD=M\n{PUSH_STR}")
    }

    // fn generate_pop(bp: &str, index: u128) -> String {}

    pub fn write_arithmetic(&mut self, raw_command: Option<&str>, command: &str) {
        self.write_to_file(command, raw_command);
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
        let mut translation = String::new();
        match command {
            CommandType::C_PUSH(_) => {
                translation = match segment {
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
                    strange_pointer => format!("--**-- Error: {strange_pointer}")
                };
            }
            CommandType::C_POP(_) => {
                translation = format!("@SP\nA=M-1\nD=M\n@SP\nM=M-1\n@{}\nA=M+{}\nM=D", segment, index)
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
        // drop(self.translated_assembly_file_handle);
        println!(
            "Assembly file written to {:?}",
            self.output_file_path.file_name()
        );
        // todo!("Infinite loop code generation")
    }
}
