use std::fs;

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

pub struct Parser<'a> {
    vm_source_code: String,
    pub current_command: &'a str,
    current_line_no: u32,
    total_file_line_no: u32,
}

impl<'a> Parser<'a> {
    pub fn new(filepath: &str) -> Parser<'a> {
        println!("Reading vm file: {}", filepath);
        let mut parser = Parser {
            vm_source_code: fs::read_to_string(filepath).expect("Couldn't read from file!"),
            current_command: "",
            current_line_no: 0,
            total_file_line_no: 0,
        };
        parser.total_file_line_no = parser.vm_source_code.lines().count() as u32;
        parser
    }

    /// Just strips out whitespace and comments
    fn clean_line<'b>(line: &'b str) -> &'b str {
        let mut line = line.trim();
        if line.contains("//") {
            line = line.split_once("//").unwrap().0;
            line = line.trim();
        }
        return line;
    }

    pub fn has_more_lines(&'a self) -> bool {
        self.current_line_no < self.total_file_line_no
    }

    /// # Panics
    /// Should be called only if has_more_lines() returns true
    pub fn advance(&'a mut self) {
        if !self.has_more_lines() {
            panic!("Can't advance since no more vm code to interprete.")
        };
        let mut is_appropriate_line = false;
        while !is_appropriate_line {
            self.current_command = self
                .vm_source_code
                .lines()
                .nth(self.current_line_no as usize)
                .expect("Error fetching next command");
            self.current_line_no += 1;
            self.current_command = Self::clean_line(&self.current_command);
            if self.current_command.is_empty() {
                is_appropriate_line = true;
            }
        }
        // // Recursively calls self as long as current command is empty
        // if self.current_command.is_empty() {
        //     self.advance();
        // }
    }

    /// # Panics
    /// if command type can't be deciphered
    pub fn command_type(self) -> CommandType<'a> {
        let mut command_list = self.current_command.split_ascii_whitespace();
        let command = command_list
            .next()
            .expect("Command section of current instruction couldn't be extracted");

        match command {
            "and" | "or" | "sub" | "eq" | "neg" | "gt" | "lt" | "not" | "add" => {
                CommandType::C_ARITHMETIC(command)
            }
            "push" => CommandType::C_PUSH(ArgumentPair {
                first: command_list
                    .next()
                    .expect("First argument of push is expected!"),
                second: command_list
                    .next()
                    .expect("Second argument of push is expected!")
                    .parse()
                    .unwrap(),
            }),
            "pop" => CommandType::C_POP(ArgumentPair {
                first: command_list
                    .next()
                    .expect("First argument of pop is expected!"),
                second: command_list
                    .next()
                    .expect("Second argument of pop is expected!")
                    .parse()
                    .unwrap(),
            }),
            _ => panic!("Couldn't decipher instruction type"),
        }
    }

    /// Returns first argument of current command
    /// # Panics
    /// Dont call for C_RETURN type
    pub fn arg1(self) -> &'a str {
        match self.command_type() {
            CommandType::C_RETURN => panic!("Arg 1 can't be called with RETURN type"),
            CommandType::C_ARITHMETIC(command) => command,
            CommandType::C_PUSH(argument_pair) => argument_pair.first,
            _ => "",
        };
        todo!()
    }

    /// Returns second argument of current command
    /// # Panics
    /// Only call if current command type
    /// is C_PUSH, C_CALL, C_POP, C_FUNCTION
    pub fn arg2(self) -> u128 {
        match self.command_type() {
            CommandType::C_PUSH(argument_pair) => argument_pair.second,
            _ => panic!("Only call for C_PUSH, C_POP, C_CALL, C_FUNCTION commandType"),
        };
        todo!()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    #[should_panic(expected = "Can't advance since no more vm code to interprete.")]
    fn testing_advance_when_no_line() {
        let parser = Parser::new("");
        todo!("Impl to test when we try to advance an empty or completed file")
    }
}
