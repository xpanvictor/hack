//! Jack Tokenizer
//!
//! Token manager based on Lexicon

use std::fs;
use std::iter::Peekable;
use std::path::Path;
use std::vec::IntoIter;

pub struct Tokenizer<'a> {
    source: Box<Peekable<core::str::SplitAsciiWhitespace<'a>>>,
    current_token: Option<TokenType<'a>>,
}

#[allow(non_camel_case_types)]
pub enum TokenType<'a> {
    T_KEYWORD(&'a str),
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
                    // TODO: might have to clean here
                    .split_ascii_whitespace()
                    .into_iter()
                    .peekable()
            ),
            current_token: None
        }
    }

    pub fn has_more_token(&mut self) -> bool {self.source.peek().is_some()}

    fn purify_next_token(&mut self) -> &str {
        // remove comments
        todo!("Remove comments")
    }

    fn get_token(raw_token: &str) -> TokenType<'_> {
        // some match logic
        todo!("token mapping")
    }

    /// Advances by setting next token from source to curr token
    ///
    /// # Panics
    ///
    /// Should be called only if has_more_token
    pub fn advance(&mut self) {
        if !self.has_more_token() {
            panic!("No more tokens!")
        }
        // A cleaner sequence
        self.current_token = Some(Self::get_token(self.purify_next_token()));
    }

    pub fn token_type(&mut self) -> TokenType {todo!()}

    pub fn key_word(&self) -> &str {todo!()}

    pub fn symbol(&self) -> char {todo!()}

    pub fn identifier(&self) -> &str {todo!()}

    pub fn int_val(&self) -> usize {todo!()}

    pub fn string_val(&self) -> &str {todo!()}
}