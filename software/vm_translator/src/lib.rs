//! VM TRanslator
//!
//! Does the job of translating using the other modules

pub mod code_writer;
pub mod parser;

use code_writer::CodeWriter;
use parser::{Parser, CommandType};

pub fn vm_translator(mut args: impl Iterator<Item = String>) {
    args.next(); // Enter next value

    let filepath = args.next().expect("Filepath is required!");
    let output_filepath = format!("{}.asm", filepath.rsplit_once(".").unwrap().0);

    let mut code_writer = CodeWriter::new(&output_filepath);
    let mut parser = Parser::new(&filepath);

    while parser.has_more_lines() {
        parser.advance();
        match parser.command_type() {
            CommandType::C_PUSH(_) | CommandType::C_POP(_) => code_writer.write_push_pop(
                Some(parser.current_command.as_str()),
                parser.command_type(),
                parser.arg1().as_str(),
                parser.arg2()
            ),
            CommandType::C_ARITHMETIC(_) => code_writer.write_arithmetic(
                Some(parser.current_command.as_str()),
                parser.arg1().as_str()
            ),
            _ => ()
        }
    }

}
