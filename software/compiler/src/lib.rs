//! JackAnalyzer
//!
//! Setup and invocation of modules

use std::path::Path;
use glob::glob;
use crate::tokenizer::{Tokenizer, TokenType};

mod tokenizer;


fn analyze_tokenizer(tokenizer: &mut Tokenizer) {
    while tokenizer.has_more_token() {
        tokenizer.advance();
        match tokenizer.token_type() {
            _ => println!("Lexer: {:?}", tokenizer.token_type())
        }
    }
}

pub fn analyzer(mut args: impl Iterator<Item = String>) {
    args.next(); // Enter next value

    let filepath = args.next().expect("Filepath is required!");
    let filepath = Path::new(&filepath);
    let output_filepath = if !filepath.is_dir() {
        filepath.with_extension("xml")
    } else {
        filepath
            .join(filepath.file_name().unwrap())
            .with_extension("xml")
    };

    if filepath.is_dir() {
        let file_pattern = filepath.join("**").join("*.jack");
        for entry in glob(file_pattern.to_str().unwrap()).unwrap() {
            match entry {
                Ok(file_path) => {
                    let mut tokenizer = Tokenizer::new(&file_path);
                    analyze_tokenizer(&mut tokenizer);
                }
                Err(e) => println!("Invalid path dir provided {:?}", e),
            }
        }
    } else {
        let mut tokenizer = Tokenizer::new(filepath);
        analyze_tokenizer(&mut tokenizer);
    }
}
