// use std::fs;
use std::{fs::File, io::Write, path};
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

impl CodeWriter {
    pub fn new(output_file: &str) -> CodeWriter {
        CodeWriter {
            translated_assembly_file_handle: File::create(output_file)
                .expect(&format!("Couldn't write to {}!", output_file)),
            output_file_path: path::Path::new(output_file).to_path_buf(),
        }
    }

    /// Helper functions
    fn generate_comment(command: &str) -> String {
        format!("// ----: {} ----\n", command)
    }

    fn generate_push(bp: &str, index: u128) -> String {
        format!("@{bp}\nA=M+{index}\nD=M\n@SP\nA=M\nM=D@SP\nM=M+1")
    }

    pub fn write_arithmetic(&mut self, raw_command: Option<&str>, command: &str) {
        self.write_to_file(command, raw_command);
    }

    /// Writes push-pop instruction
    /// # Panics
    /// Don't call if CommandType isn't C_PUSH or C_POP
    pub fn write_push_pop(&mut self, raw_command: Option<&str>, command: CommandType, segment: &str, index: u128) {
        let mut translation = String::new();
        match command {
            CommandType::C_PUSH(_) => {
                translation = {
                    let bp = match segment {
                        "local" => "LCL",
                        "argument" => "ARG",
                        _ => ""
                    };
                    Self::generate_push(bp, index)
                };
            },
            CommandType::C_POP(_) => (),
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
