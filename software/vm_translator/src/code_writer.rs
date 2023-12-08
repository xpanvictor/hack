// use std::fs;
use std::{fs::File, io::Write, path};

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

    pub fn write_arithmetic(&mut self, command: &str) {
        self.translated_assembly_file_handle
            .write((format!("{}\n", command)).as_bytes())
            .expect("Couldn't write to output file");
        todo!("Implementation to convert command to assembly code");
    }

    pub fn write_push_pop(&mut self, command: &str) {
        let assembly_translation = "";
        Self::write_to_file(
            &mut self.translated_assembly_file_handle,
            assembly_translation,
            Some(command),
        );
    }

    fn write_to_file(file_handle: &mut File, translation: &str, vm_command: Option<&str>) {
        if let Some(vm_command_str) = vm_command {
            file_handle
                .write(format!("//{}\n", vm_command_str).as_bytes())
                .expect("Couldn't write push-pop translation to output file");
            file_handle
                .write(format!("{}\n", translation).as_bytes())
                .expect("Couldn't write push-pop translation to output file");
        }
    }
}

impl Drop for CodeWriter {
    fn drop(&mut self) {
        // drop(self.translated_assembly_file_handle);
        println!(
            "Assembly file written to {:?}",
            self.output_file_path.file_name()
        )
    }
}
