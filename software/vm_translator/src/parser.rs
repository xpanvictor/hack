use std::{fs, str::Lines};
use std::cell::RefCell;

pub struct ArgumentPair<'a> {
    first: &'a str,
    second: u128,
}

#[allow(non_camel_case_types)]
pub enum CommandType<'a> {
    C_ARITHMETIC(&'a str),
    C_PUSH(ArgumentPair<'a>),
    C_LABEL,
    C_POP(ArgumentPair<'a>),
    C_GOTO,
    C_IF,
    C_FUNCTION,
    C_RETURN,
    C_CALL,
}

pub struct Parser {
    vm_source_code: Box<dyn Iterator<Item=String>>,
    pub current_command: String,
}

/*
impl<'a> IntoIterator for &'a Parser<'a> {
type Item = &'a str;
type IntoIter = ParserIterator<'a>;

fn into_iter(self) -> Self::IntoIter {
todo!()
}
}

struct ParserIterator<'a> {
commands_total: &'a Parser<'a>
}

impl<'a> Iterator for ParserIterator<'a> {
type Item = &'a str;

fn next(&mut self) -> Option<Self::Item> {
return self.commands_total.vm_source_code.lines().
}
}
*/

impl Parser {
    pub fn new(filepath: &str) -> Parser {
        println!("Reading vm file: {}", filepath);
        let mut parser = Parser {
            vm_source_code: Box::new(
                fs::read_to_string(filepath)
                    .expect("Couldn't read the source code")
                    .lines()
                    .map(|x| x.to_string())
                    .collect::<Vec<String>>()
                    .into_iter()
            ),
            current_command: "".to_owned()
        };
        parser.advance();
        parser
    }

    /// Just strips out whitespace and comments
    fn clean_line(line: String) -> String {
        let mut line = line.trim();
        if line.contains("//") {
            line = line.split_once("//").unwrap().0;
            line = line.trim();
        }
        println!("{line}");
        return line.to_string();
    }

    pub fn has_more_lines(&mut self) -> bool {
        // let bc = Box::(&self.vm_source_code);
        self.vm_source_code.as_mut().peekable().peek().is_some()
    }


    /// # Panics
    /// Should be called only if has_more_lines() returns true
    pub fn advance(&mut self) {
        if !self.has_more_lines() {
            panic!("Can't advance since no more vm code to interpret.")
        };

        self.current_command = self.vm_source_code.next().unwrap();
        println!("{}--noted", self.current_command);

        // Recursively calls self as long as current command is empty
        // if self.current_command.is_empty() {
        //     self.advance();
        // }
    }

    // /// # Panics
    // /// if command type can't be deciphered
    // pub fn command_type(self) -> CommandType<'a> {
    //     let mut command_list = self.current_command.split_ascii_whitespace();
    //     let command = command_list
    //         .next()
    //         .expect("Command section of current instruction couldn't be extracted");
    //
    //     match command {
    //         "and" | "or" | "sub" | "eq" | "neg" | "gt" | "lt" | "not" | "add" => {
    //             CommandType::C_ARITHMETIC("")
    //         }
    //         // "push" => CommandType::C_PUSH(ArgumentPair {
    //         //     first: command_list
    //         //         .next()
    //         //         .expect("First argument of push is expected!"),
    //         //     second: command_list
    //         //         .next()
    //         //         .expect("Second argument of push is expected!")
    //         //         .parse()
    //         //         .unwrap(),
    //         // }),
    //         // "pop" => CommandType::C_POP(ArgumentPair {
    //         //     first: command_list
    //         //         .next()
    //         //         .expect("First argument of pop is expected!"),
    //         //     second: command_list
    //         //         .next()
    //         //         .expect("Second argument of pop is expected!")
    //         //         .parse()
    //         //         .unwrap(),
    //         // }),
    //         _ => panic!("Couldn't decipher instruction type"),
    //     }
    // }
    //
    // /// Returns first argument of current command
    // /// # Panics
    // /// Dont call for C_RETURN type
    // // pub fn arg1(&self) -> &str {
    // //     match self.command_type() {
    // //         CommandType::C_RETURN => panic!("Arg 1 can't be called with RETURN type"),
    // //         CommandType::C_ARITHMETIC(command) => command,
    // //         CommandType::C_PUSH(argument_pair) => argument_pair.first,
    // //         _ => "",
    // //     }
    // // }
    //
    // /// Returns second argument of current command
    // /// # Panics
    // /// Only call if current command type
    // /// is C_PUSH, C_CALL, C_POP, C_FUNCTION
    // pub fn arg2(self) -> u128 {
    //     match self.command_type() {
    //         CommandType::C_PUSH(argument_pair) | CommandType::C_POP(argument_pair) => {
    //             argument_pair.second
    //         }
    //         _ => panic!("Only call for C_PUSH, C_POP, C_CALL, C_FUNCTION commandType"),
    //     }
    // }
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
