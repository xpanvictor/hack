//! JackAnalyzer
//!
//! Setup and invocation of modules

use crate::tokenizer::{TokenType, Tokenizer};
use glob::glob;
use std::path::Path;
use xml_writer::XMLWriter;

mod tokenizer;
mod xml_writer;

fn analyze_tokenizer(tokenizer: &mut Tokenizer, xml_writer: &mut XMLWriter) {
    while tokenizer.has_more_token() {
        tokenizer.advance();
        match tokenizer.token_type() {
            TokenType::T_IDENTIFIER(tt) =>
                xml_writer.write_token("identifier", tt),
            TokenType::T_KEYWORD(tt) =>
                xml_writer.write_token("keyword", tt),
            TokenType::T_STRING_CONST(tt) =>
                xml_writer.write_token("stringConstant", tt),
            TokenType::T_INT_CONST(tt) =>
                xml_writer.write_token("intConstant", format!("{tt}").as_str()),
            TokenType::T_SYMBOL(tt) =>
                xml_writer.write_token("symbol", format!("{tt}").as_str()),
        }
    }
}

pub fn analyzer(mut args: impl Iterator<Item = String>) {
    args.next(); // Enter next value

    let filepath = args.next().expect("Filepath is required!");
    let filepath = Path::new(&filepath);

    if filepath.is_dir() {
        let file_pattern = filepath.join("**").join("*.jack");
        for entry in glob(file_pattern.to_str().unwrap()).unwrap() {
            match entry {
                Ok(file_path) => {
                    let output_file_path = file_path
                        .with_extension("xml");

                    let mut tokenizer = Tokenizer::new(&file_path);
                    let mut xml_writer = XMLWriter::new(&output_file_path);
                    analyze_tokenizer(&mut tokenizer, &mut xml_writer);
                }
                Err(e) => println!("Invalid path dir provided {:?}", e),
            }
        }
    } else {
        let output_file_path = filepath
            .with_extension("xml");

        let mut tokenizer = Tokenizer::new(filepath);
        let mut xml_writer = XMLWriter::new(output_file_path.as_path());
        analyze_tokenizer(&mut tokenizer, &mut xml_writer);
    }
}
