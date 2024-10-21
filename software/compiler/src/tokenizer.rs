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
#[derive(Debug)]
pub enum TokenType {
    /// class, constructor, function, etc
    T_KEYWORD(String),
    /// terminals .e.g ( ) , { } < |
    T_SYMBOL(char),
    /// sequence of letters, digits, and '_' not starting with digit
    T_IDENTIFIER(String),
    /// sequence of int digits
    T_INT_CONST(u32),
    /// sequence of chars, not including double quotes or \n
    T_STRING_CONST(String),
}

/// States for the tokenizer
/// Using a state machine
#[derive(Debug)]
pub enum State {
    /// Marks advance able
    Start,
    /// (is_multiline_comment)
    Comment(bool),
    /// char type -> keyword | identifier | string_const, can start with " which must end with " if so.
    Ascii,
    /// int char delimiter and ends with whitespace
    Number,
    /// shows symbol type
    Symbol,
    CapturedSymbol(char),
    /// End of reading
    End
}

// list of words that are reserved keywords and are used in match expr
const KEYWORDS: &[&str] = &[
    "class",
    "constructor",
    "function",
    "method",
    "field",
    "static",
    "var",
    "int",
    "char",
    "boolean",
    "void",
    "true",
    "false",
    "null",
    "this",
    "let",
    "do",
    "if",
    "else",
    "while",
    "return",
];

fn is_keyword(word: &str) -> bool {
    KEYWORDS.contains(&word)
}

impl Tokenizer {
    pub fn new(file_path: &Path) -> Self {
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
        self.consume_while(&mut |ch | ch.is_whitespace());
        self.source.peek().is_some()
    }

    pub fn which_state(&mut self) -> State {
        loop {
            if !self.has_more_token() {
                break State::End
            }
            let c = self.source.peek().unwrap().to_owned();

            let state = match c {
                ch if ch.is_whitespace() => State::Start,
                '/' => {
                    let _ = self.source.next();
                    let next_c = self.source.peek();
                    match next_c.unwrap() {
                        '/' => State::Comment(false),
                        '*' => State::Comment(true),
                        wt if wt.is_whitespace() => State::CapturedSymbol(c),
                        _ => panic!("Unrecognized comment: {}", next_c.unwrap()),
                    }
                }
                ch if ch.is_numeric() => State::Number,
                ch if ch.is_alphanumeric() => State::Ascii,
                _ => State::Symbol,
            };

            match state {
                State::Start => {
                    self.source.next().unwrap();
                    continue;
                }
                _ => break state,
            }
        }
    }

    fn clean_comment(&mut self, is_multiline: bool) {
        loop {
            let _ = self.consume_while(&mut |ch| {
                return if is_multiline {
                    ch != &'*'
                } else {
                    ch != &'\n'
                };
            });
            let _ = self.source.next().unwrap_or(' ');

            if !is_multiline {
                break;
            }
            let next_overhead = self
                .source
                .next()
                .expect("Requires another lookahead for last '/' of multiline comment");

            if next_overhead == '/' {
                break;
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
            State::Start => self.purify_calculate_next_token(),
            State::End => panic!("Should've checked if has tokens!"),
            State::Comment(is_multiline_comment) => {
                self.clean_comment(is_multiline_comment);
                // recursively try again
                self.purify_calculate_next_token()
            }
            State::Ascii => self.get_char_type(),
            State::Number => {
                let calc_number = self
                    .consume_while(&mut |ch| ch.is_numeric())
                    .parse::<usize>()
                    .expect("Invalid number");
                TokenType::T_INT_CONST(
                    calc_number
                        .try_into()
                        .expect("Size boundary for number not fit"),
                )
            }
            State::CapturedSymbol(char) => TokenType::T_SYMBOL(char),
            State::Symbol => {
                let consumed_symbol = self
                    .source
                    .next()
                    .expect("Expects another symbol of type 'char'");
                TokenType::T_SYMBOL(consumed_symbol)
            }
        }
    }

    /// One char lookahead convenience utility using closure
    /// for deterministic end of read; it muts source
    fn consume_while<F>(&mut self, test: &mut F) -> String
    where
        F: FnMut(&char) -> bool,
    {
        let mut gen_result = String::new();

        loop {
            let temp = self.source.peek();
            if temp.is_none() || !test(temp.unwrap()) {
                break;
            }
            gen_result.push(self.source.next().unwrap())
        }
        // drain the delimeter

        gen_result
    }

    fn consume_char(&mut self) -> Option<char> {
        let ch = self.source.next();
        self.consume_while(&mut |c| !c.is_whitespace());
        ch
    }

    /// Operates only on the State::Ascii form which is
    fn get_char_type(&mut self) -> TokenType {
        let ch = self.source.peek().unwrap();
        match ch {
            ch if ch == &'"' => {
                self.consume_char();
                let str_const = self.consume_while(&mut |c| *c != '"');
                // don't last '"' but advance
                self.consume_char();
                TokenType::T_STRING_CONST(str_const)
            }
            _ => {
                let consumed_word = self.consume_while(&mut |ch| ch.is_alphanumeric());
                // check if is keyword, else return identifier
                if is_keyword(&consumed_word) {
                    TokenType::T_KEYWORD(consumed_word)
                } else {
                    TokenType::T_IDENTIFIER(consumed_word)
                }
            }
        }
    }

    /// Advances by setting next token from source to curr token
    ///
    /// # Panics
    ///
    /// Should be called only if it has_more_token
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
