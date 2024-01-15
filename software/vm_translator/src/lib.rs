//! VM TRanslator
//!
//! Does the job of translating using the other modules

pub mod code_writer;
pub mod parser;

use std::{
    cell::{Ref, RefCell, RefMut},
    rc::Rc,
};

// use code_writer::CodeWriter;
use parser::Parser;

pub fn vm_translator(mut args: impl Iterator<Item = String>) {
    args.next(); // Enter next value

    let filepath = args.next().expect("Filepath is required!");
    let output_filepath = format!("{}.asm", filepath.rsplit_once(".").unwrap().0);

    // let mut code_writer = CodeWriter::new(&output_filepath);
    let mut parser = Parser::new(&filepath);

    let mut num = 0;
    // while parser.has_more_lines() {
    //     num+=1;
    //     println!("{}-{}", parser.current_command, num);
    //     // parser.advance();
    // }

}
