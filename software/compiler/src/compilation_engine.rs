use crate::tokenizer::{TokenType, Tokenizer};
use crate::xml_writer::XMLWriter;

pub struct CompilationEngine<'a> {
    xml_writer: &'a mut XMLWriter,
    tokenizer: &'a mut Tokenizer,
}

impl<'a> CompilationEngine<'a> {
    pub fn new(tokenizer: &'a mut Tokenizer, xml_writer: &'a mut XMLWriter) -> Self {
        CompilationEngine {
            xml_writer,
            tokenizer
        }
    }

    /// utility to handle processing
    /// input: token as str
    /// advances the tokenizer by 1 step
    fn process(&mut self, token: TokenType) {
        let curr_token = self.tokenizer.token_type();
        if curr_token == &token {
            self.xml_writer.write_formatted_token(curr_token);
        } else {
            self.xml_writer.write_token("Syntax error");
            eprintln!("Err parsing {:?} curr {:?}", token, curr_token)
        }
        // advance tokenizer
        self.tokenizer.advance();
    }

    pub fn compile_class() {todo!()}
    pub fn compile_class_var_dec() {todo!()}
    pub fn compile_subroutine() {todo!()}
    pub fn compile_parameter_list() {todo!()}
    pub fn compile_subroutine_body() {todo!()}
    pub fn compile_var_dec() {todo!()}
    pub fn compile_statements(&mut self) {todo!()}
    pub fn compile_let() {todo!()}
    pub fn compile_if(&mut self) {
        self.process(TokenType::T_KEYWORD("if".to_string()));
        self.process(TokenType::T_SYMBOL("(".into()));
        self.compile_expression();
        self.process(TokenType::T_SYMBOL(")".into()));
        self.process(TokenType::T_SYMBOL("{".into()));
        self.compile_statements();
        self.process(TokenType::T_SYMBOL("}".into()));
        // optional 'else' statement
        todo!("Implement the qualifier-grouping fns.")
    }
    pub fn compile_while() {todo!()}
    pub fn compile_do() {todo!()}
    pub fn compile_return(&mut self) {
        self.process(TokenType::T_KEYWORD("return".to_string()));
        self.compile_expression();
    }
    pub fn compile_expression(&mut self) {todo!()}
    pub fn compile_term() {todo!()}
    pub fn compile_expression_list() -> usize {todo!()}
}
