use std::fs::File;
use std::io::Write;
use std::path::Path;
use crate::tokenizer::TokenType;

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

    pub fn write_token_xml(&mut self, token_name: &str, token_value: &str) {
        let token_line = format!("<{token_name}> {token_value} </{token_name}> \n");
        self.output_file.write_all(token_line.as_bytes()).unwrap()
    }

    pub fn write_token(&mut self, token: &str) {
        self.output_file.write_all(token.as_bytes()).unwrap()
    }

    pub fn write_formatted_token(&mut self, token: &TokenType) {
        let token_name = todo!();
        let token_value = token.get_token_content_as_string();
        self.write_token_xml(token_name, token_value.as_str());
    }
}


impl Drop for XMLWriter {
    fn drop(&mut self) {
        self.output_file.write_all("</tokens>".as_bytes()).unwrap()
    }
}
