//! Jack Tokenizer
//!
//! Token manager based on Lexicon

use std::fs;
use std::iter::Peekable;
use std::path::Path;
use std::vec::IntoIter;

pub struct Tokenizer<'a> {
    source: Box<Peekable<core::str::SplitAsciiWhitespace<'a>>>,
    current_token: TokenType,
}

#[allow(non_camel_case_types)]
pub enum TokenType {
    T_TOKENS, // default token
    T_KEYWORD,
    T_SYMBOL,
    T_IDENTIFIER,
    T_INT_CONST,
    T_STRING_CONST,
}

impl<'a> Tokenizer<'a> {
    fn new(file_path: &Path) -> Self {
        //! The tokenizer splits by space
        Tokenizer {
            source: Box::new(
                fs::read_to_string(file_path)
                    .expect("Couldn't read source stream")
                    .split_ascii_whitespace()
                    .into_iter()
                    .peekable()
            ),
            current_token: TokenType::T_TOKENS
        }
    }

    pub fn has_more_token(&mut self) -> bool {self.source.peek().is_some()}
}