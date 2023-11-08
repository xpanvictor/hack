use std::fs;

#[allow(non_camel_case_types)]
pub enum CommandType {
    C_ARITHMETIC,
    C_PUSH,
    C_LABEL,
    C_POP,
    C_GOTO,
    C_IF,
    C_FUNCTION,
    C_RETURN,
    C_CALL,
}

pub struct Parser<'a> {
    vm_source_code: String,
    current_command: &'a str,
}

impl<'a> Parser<'a> {
    pub fn new(filepath: &str) -> Parser<'a> {
        Parser {
            vm_source_code: fs::read_to_string(filepath).expect("Couldn't read from file!"),
            current_command: "",
        }
    }

    pub fn has_more_lines(self) -> bool {}

    pub fn advance(self) {}

    pub fn command_type(self) -> CommandType {}

    pub fn arg1(self) -> &'a str {}

    /// Returns second argument of current command
    /// # Panics
    /// Only call if current command type
    /// is C_PUSH, C_CALL, C_POP, C_FUNCTION
    pub fn arg2(self) -> u128 {}
}
