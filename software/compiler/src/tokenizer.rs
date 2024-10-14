//! Jack Tokenizer
//!
//! Token manager based on Lexicon

use std::iter::Peekable;
use std::path::Path;
use std::{fs, usize, vec};

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

/// States for the tokenizer
/// Using a state machine
pub enum State {
    Start,
    Comment(bool), // is_multiline_comment
    Ascii,
    Number,
    Symbol,
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

    pub fn which_state(&mut self) -> State {
        let c = self.source.next().unwrap();

        loop {
            let state = match c {
                ch if ch.is_whitespace() => State::Start,
                '/' => {
                    let next_c = self.source.peek();
                    match next_c.unwrap() {
                        '/' => State::Comment(false),
                        '*' => State::Comment(true),
                        _ => todo!(),
                    }
                }
                ch if ch.is_ascii() => State::Ascii,
                ch if ch.is_numeric() => State::Number,
                _ => State::Symbol,
            };

            match state {
                State::Start => continue,
                _ => break state,
            }
        }
    }

    fn purify_calculate_next_token(&mut self) -> TokenType {
        //! Note: Handles a bunch of functionalities for token management
        //!
        //! 1. Removes comments.
        //! 2. Joins groups of certain tokens

        let curr_state = self.which_state();
        match curr_state {
            State::Start => todo!(),
            State::Comment(is_multiline_comment) => todo!(),
            State::Ascii => {
                let combined_value = self.consume_while(&mut |ch| !ch.is_whitespace());
                Self::get_char_type(&combined_value)
            }
            State::Number => {
                let calc_number = self
                    .consume_while(&mut |ch| !ch.is_whitespace())
                    .parse::<usize>()
                    .expect("Invalid number");
                TokenType::T_INT_CONST(
                    calc_number
                        .try_into()
                        .expect("Size boundary for number not fit"),
                )
            }
            State::Symbol => todo!(),
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

    fn get_char_type(val: &str) -> TokenType {
        todo!()
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
        self.current_token = Some(self.purify_calculate_next_token())
    }

    pub fn token_type(&mut self) -> &TokenType {
        if let Some(curr_token) = &self.current_token {
            curr_token
        } else {
            panic!("Invalid token")
        }
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
