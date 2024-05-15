//! VM TRanslator
//!
//! Does the job of translating using the other modules

pub mod code_writer;
mod constants;
pub mod parser;

use glob::glob;
use std::path::Path;

use code_writer::CodeWriter;
use parser::{CommandType, Parser};

fn vm_functionality(parser: &mut Parser, code_writer: &mut CodeWriter) {
    while parser.has_more_lines() {
        parser.advance();
        match parser.command_type() {
            CommandType::C_PUSH(_) | CommandType::C_POP(_) => code_writer.write_push_pop(
                Some(parser.current_command.as_str()),
                parser.command_type(),
                parser.arg1().as_str(),
                parser.arg2(),
            ),
            CommandType::C_ARITHMETIC(_) => code_writer
                .write_arithmetic(Some(parser.current_command.as_str()), parser.command_type()),
            _ => (),
        };
    }
}

pub fn vm_translator(mut args: impl Iterator<Item = String>) {
    args.next(); // Enter next value

    let filepath = args.next().expect("Filepath is required!");
    let filepath = Path::new(&filepath);
    let output_filepath = format!("{}.asm", filepath.file_stem().unwrap().to_str().unwrap());
    let mut code_writer = CodeWriter::new(&output_filepath);

    if filepath.is_dir() {
        let file_pattern = filepath.join("**").join("*.vm");
        for entry in glob(file_pattern.to_str().unwrap()).unwrap() {
            match entry {
                Ok(file_path) => {
                    let mut parser = Parser::new(&file_path);
                    vm_functionality(&mut parser, &mut code_writer);
                }
                Err(e) => println!("Invalid path dir provided {:?}", e),
            }
        }
    } else {
        let mut parser = Parser::new(filepath);
        vm_functionality(&mut parser, &mut code_writer);
    }
}
