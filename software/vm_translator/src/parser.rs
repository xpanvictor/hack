use std::fs;
use std::iter::Peekable;
use std::path::Path;
use std::vec::IntoIter;

#[derive(Clone)]
pub struct ArgumentPair {
    pub(crate) first: String,
    pub(crate) second: u128,
}

#[allow(non_camel_case_types)]
#[derive(Clone)]
pub enum CommandType {
    C_ARITHMETIC(String),
    C_PUSH(ArgumentPair),
    C_LABEL(String),
    C_POP(ArgumentPair),
    C_GOTO,
    C_IF,
    C_FUNCTION,
    C_RETURN,
    C_CALL,
}

pub struct Parser {
    vm_source_code: Box<Peekable<IntoIter<String>>>, // Box<dyn Iterator<String>>
    pub current_command: String,
}

impl Parser {
    pub fn new(filepath: &Path) -> Parser {
        println!("Reading vm file: {}", filepath.display());
        Parser {
            vm_source_code: Box::new(
                fs::read_to_string(filepath)
                    .expect("Couldn't read the source code")
                    .lines()
                    .map(|x| x.to_string())
                    .collect::<Vec<String>>()
                    .into_iter()
                    .peekable(),
            ),
            current_command: "".to_owned(),
        }
    }

    /// Just strips out whitespace and comments
    fn clean_line(line: String) -> String {
        let mut line = line.trim();
        if line.contains("//") {
            line = line.split_once("//").unwrap().0;
            line = line.trim();
        };
        line.to_string()
    }

    pub fn has_more_lines(&mut self) -> bool {
        self.vm_source_code.peek().is_some()
    }

    /// # Panics
    /// Should be called only if has_more_lines() returns true
    pub fn advance(&mut self) {
        if !self.has_more_lines() {
            panic!("Can't advance since no more vm code to interprete.")
        };

        self.current_command = Self::clean_line(self.vm_source_code.next().unwrap());

        // Recursively calls self as long as current command is empty
        if self.current_command.is_empty() {
            self.advance();
        }
    }

    /// # Panics
    /// if command type can't be deciphered
    pub fn command_type(&self) -> CommandType {
        let mut command_list = self.current_command.split_ascii_whitespace();
        let command = command_list
            .next()
            .expect("Command section of current instruction couldn't be extracted");

        match command {
            "and" | "or" | "sub" | "eq" | "neg" | "gt" | "lt" | "not" | "add" => {
                CommandType::C_ARITHMETIC(command.to_string())
            }
            "push" => CommandType::C_PUSH(ArgumentPair {
                first: command_list
                    .next()
                    .expect("First argument of push is expected!")
                    .to_owned(),
                second: command_list
                    .next()
                    .expect("Second argument of push is expected!")
                    .parse()
                    .unwrap(),
            }),
            "pop" => CommandType::C_POP(ArgumentPair {
                first: command_list
                    .next()
                    .expect("First argument of pop is expected!")
                    .to_string(),
                second: command_list
                    .next()
                    .expect("Second argument of pop is expected!")
                    .parse()
                    .unwrap(),
            }),
            "label" => CommandType::C_LABEL(String::from(
                command_list
                    .next()
                    .expect("A label location: string required"),
            )),
            _ => panic!(
                "Couldn't decipher instruction type {}",
                self.current_command
            ),
        }
    }

    /// Returns first argument of current command
    /// # Panics
    /// Dont call for C_RETURN type
    pub fn arg1(&self) -> String {
        match self.command_type() {
            CommandType::C_RETURN => panic!("Arg 1 can't be called with RETURN type"),
            CommandType::C_ARITHMETIC(command) => command.to_lowercase(),
            CommandType::C_PUSH(argument_pair) => argument_pair.first.to_lowercase(),
            CommandType::C_POP(argument_pair) => argument_pair.first.to_lowercase(),
            CommandType::C_LABEL(command) => command, // retain case for case sensitive language
            _ => "".to_owned(),
        }
    }

    /// Returns second argument of current command
    /// # Panics
    /// Only call if current command type
    /// is C_PUSH, C_CALL, C_POP, C_FUNCTION
    pub fn arg2(&self) -> u128 {
        match self.command_type() {
            CommandType::C_PUSH(argument_pair) | CommandType::C_POP(argument_pair) => {
                argument_pair.second
            }
            _ => panic!("Only call for C_PUSH, C_POP, C_CALL, C_FUNCTION commandType"),
        }
    }
}

#[cfg(test)]
mod tests {
    // use super::*;

    #[test]
    #[should_panic(expected = "Can't advance since no more vm code to interprete.")]
    fn testing_advance_when_no_line() {
        // let parser = Parser::new("");
        todo!("Impl to test when we try to advance an empty or completed file")
    }
}
