//! Jack Tokenizer
//!
//! Token manager based on Lexicon

use std::iter::Peekable;
use std::path::Path;
use std::{fs, vec};

pub struct Tokenizer {
    source: Box<Peekable<vec::IntoIter<char>>>,
    current_token: Option<TokenType>,
}

#[allow(non_camel_case_types)]
pub enum TokenType {
    T_KEYWORD(String),
    T_SYMBOL,
    T_IDENTIFIER,
    T_INT_CONST(u32),
    T_STRING_CONST,
}

impl Tokenizer {
    fn new(file_path: &Path) -> Self {
        //! The tokenizer splits by space
        Tokenizer {
            source: Box::new(
                fs::read_to_string(file_path)
                    .expect("Couldn't read source stream")
                    .chars()
                    .map(|x| x.to_owned())
                    .collect::<Vec<_>>()
                    .into_iter()
                    .peekable(),
            ),
            current_token: None,
        }
    }

    pub fn has_more_token(&mut self) -> bool {
        self.source.peek().is_some()
    }

    fn purify_calculate_next_token(&mut self) -> char {
        //! Note: Handles a bunch of functionalities for token management
        //!
        //! 1. Removes comments.
        //! 2. Joins groups of certain tokens
        // clean comment
        let ch = self.source.next().unwrap();
        match ch {
            // /* multiline comment */
            ch if ch == '/' && self.source.peek().unwrap() == &'*' => {
                todo!("Read till terminating */")
            }
            // single line comment
            ch if ch == '/' && self.source.peek().unwrap() == &'/' => {
                todo!("Read till line end")
            }
            // clean whitespace
            ch if ch.is_whitespace() => {
                self.consume_while(&mut |ch| ch.is_whitespace());
                self.source.next().expect("Couldn't take next char")
            }
            _ => ch,
        }
    }

    fn consume_while<F>(&mut self, test: &mut F) -> String
    where
        F: FnMut(&char) -> bool,
    {
        let mut gen_result = String::new();

        loop {
            let temp = self.source.peek();
            if temp.is_none() || test(temp.unwrap()) {
                break;
            }
            gen_result.push(self.source.next().unwrap())
        }

        gen_result
    }

    /// # Panics
    ///
    /// Unregistered token types panic
    fn get_token(raw_token: &str) -> TokenType {
        // some match logic
        match raw_token {
            "class" | "constructor" => TokenType::T_KEYWORD(raw_token.to_string()),
            // check for integer
            s if s.trim().parse::<u32>().is_ok() => {
                TokenType::T_INT_CONST(s.parse::<u32>().unwrap())
            }
            _ => panic!("Unknown token: {}", raw_token),
        }
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
        self.current_token = Some(Self::get_token(self.purify_calculate_next_token()));
    }

    pub fn token_type(&mut self) -> TokenType {
        todo!()
    }

    pub fn key_word(&self) -> &str {
        todo!()
    }

    pub fn symbol(&self) -> char {
        todo!()
    }

    pub fn identifier(&self) -> &str {
        todo!()
    }

    pub fn int_val(&self) -> usize {
        todo!()
    }

    pub fn string_val(&self) -> &str {
        todo!()
    }
}
