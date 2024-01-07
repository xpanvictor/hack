//! VM TRanslator
//!
//! Does the job of translating using the other modules

pub mod code_writer;
pub mod parser;

use std::{
    borrow::BorrowMut,
    cell::{RefCell, RefMut},
    rc::Rc,
};

use code_writer::CodeWriter;
use parser::Parser;

pub fn vm_translator(mut args: impl Iterator<Item = String>) {
    args.next(); // Enter next value

    let filepath = args.next().expect("Filepath is required!");
    let output_filepath = format!("{}.asm", filepath.rsplit_once(".").unwrap().0);

    // let vm_parser = Parser::new(&filepath);
    let vm_parser_rc = Rc::new(RefCell::new(Parser::new(&filepath)));
    let mut code_writer = CodeWriter::new(&output_filepath);

    // todo: fix the error with the borrow
    while vm_parser_rc.borrow().has_more_lines() {
        let vm_parser = Some(Rc::clone(&vm_parser_rc).borrow_mut());
        if let Some(parser) = vm_parser {
            parser.advance();
        }
    }
}
