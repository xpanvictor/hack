// use std::fs;
use std::{fs::File, io::Write};

pub struct CodeWriter {
    translated_assembly_file_handle: File,
}

impl CodeWriter {
    pub fn new(output_file: &str) -> CodeWriter {
        CodeWriter {
            translated_assembly_file_handle: File::create(output_file)
                .expect(&format!("Couldn't write to {}!", output_file)),
        }
    }

    pub fn write_arithmetic(mut self, command: &str) {
        self.translated_assembly_file_handle
            .write_all(b"Hey")
            .expect("Couldn't write to output file");
        todo!("Implementation to convert command to assembly code");
    }
}
