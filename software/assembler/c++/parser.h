#include <fstream>
#include <iostream>
#include <regex>
#include <unordered_map>

#pragma once

using namespace std;

enum ECurrentPhase
{
    INITIALIZATION,
    FIRST_PASS,
    SECOND_PASS
};

enum EInstructionType
{
    A_INSTRUCTION,
    L_INSTRUCTION,
    C_INSTRUCTION
};

/// Strips out whitespace, newline, tab
/// and comments
string stripNonCode(const string &raw);

class Parser
{
private:
    /* data */
    const char *filepath;
    ifstream assembly_file_reader;
    ofstream binary_file_writer;
    string assembly_content;
    int current_pos = 0;

public:
    Parser(const char *filepath);
    ~Parser(void);

    unordered_map<string, int> symbol_table;
    string binay_file_path;
    int assembly_file_line_size;
    int line_counter = 0;
    int assembly_counter = 0;
    ECurrentPhase current_phase;
    string current_line;

    void initialization_phase(void);
    int first_pass(void); // -1 for failure

    bool hasMoreLines(void);
    /**
     * Steps through whitespaces and comments
     * Note: Only called when hasMoreLines() is true
     */
    void advance(void);
    /**
     * Returns the instructionType of the current instruction
     */
    EInstructionType instructionType(void);
    /**
     * Returns symbol of current instruction
     */
    string symbol(void);
    /**
     * Returns the symbolic dest part
     * Note: Should be called only if instructionType is A | L Instruction
     */
    string dest(void);
    /**
     * Returns the symbolic comp part
     * Note: Only called when instructionType is C_INSTRUCTION
     */
    string comp(void);
    /**
     * Returns the symbolic jump part
     * Note: Only called when instructionType is C_INSTRUCTION
     * */
    string jump(void);

    /**
     * Using the parser to write lines in the binary file
     */
    void writeBinaryLine(string binary_line);

    /**
     * Reset the parser to initiaite another phase
     */
    void resetParser(ECurrentPhase);
};
