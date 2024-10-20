use std::fs::File;
use std::io::Write;
use std::path::Path;

pub struct XMLWriter {
    pub output_file: File,
}


impl XMLWriter {
    pub fn new(filepath: &Path) -> XMLWriter {
        let mut xml_writer = XMLWriter {
            output_file: File::create(filepath).expect(format!("Unable to write to {:?}", filepath).as_str()),
        };

        // initial opening tag
        xml_writer.output_file.write_all("<tokens>\n".as_bytes()).expect("Unable to write initial tag!");

        xml_writer
    }

    pub fn write_token(&mut self, token_name: &str, token_value: &str) {
        let token_line = format!("<{token_name}> {token_value} </{token_name}> \n");
        self.output_file.write_all(token_line.as_bytes()).unwrap()
    }
}


impl Drop for XMLWriter {
    fn drop(&mut self) {
        self.output_file.write_all("</tokens>".as_bytes()).unwrap()
    }
}
