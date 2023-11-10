// use std::fs;
use std::{
    fs::{File, OpenOptions},
    io::Write,
    path,
};

pub struct CodeWriter {
    translated_assembly_file_handle: File,
    output_file_path: path::PathBuf,
}

impl CodeWriter {
    pub fn new(output_file: &str) -> CodeWriter {
        CodeWriter {
            translated_assembly_file_handle: OpenOptions::new()
                .append(true)
                .truncate(true)
                .open(output_file)
                .expect(&format!("Couldn't write to {}!", output_file)),
            output_file_path: path::Path::new(output_file).to_path_buf(),
        }
    }

    pub fn write_arithmetic(mut self, command: &str) {
        self.translated_assembly_file_handle
            .write((format!("{}\n", command)).as_bytes())
            .expect("Couldn't write to output file");
        todo!("Implementation to convert command to assembly code");
    }

    pub fn write_push_pop(mut self, command: &str) {
        let assembly_translation = "";
        self.translated_assembly_file_handle
            .write(format!("{}\n", assembly_translation).as_bytes())
            .expect("Couldn't write push-pop translation to output file");
    }
}

impl Drop for CodeWriter {
    fn drop(&mut self) {
        // self.translated_assembly_file_handle;
        println!(
            "Assembly file written to {:?}",
            self.output_file_path.file_name()
        )
    }
}
