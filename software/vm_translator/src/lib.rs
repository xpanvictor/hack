//! VM TRanslator
//!
//! Does the job of translating using the other modules

pub mod code_writer;
pub mod parser;

use std::{
    cell::{Ref, RefCell, RefMut},
    rc::Rc,
};

use code_writer::CodeWriter;
use parser::Parser;

pub fn vm_translator(mut args: impl Iterator<Item = String>) {
    args.next(); // Enter next value

    let filepath = args.next().expect("Filepath is required!");
    let output_filepath = format!("{}.asm", filepath.rsplit_once(".").unwrap().0);

    // let mut code_writer = CodeWriter::new(&output_filepath);
    // let parser = Parser::new(&filepath);
    // let mut vm_parser_rc = Rc::new(RefCell::new(&parser));
    //
    // while vm_parser_rc.borrow().has_more_lines() {
    //     let vm_parser = Rc::clone(&vm_parser_rc);
    //     let mut vm_parser = vm_parser.borrow_mut();
    //     // vm_parser.advance();
    //     Rc::clone(&vm_parser_rc);
    // }

}
