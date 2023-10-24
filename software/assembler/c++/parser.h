#include <fstream>
#include <iostream>
#include <unordered_map>

#pragma once

using namespace std;

enum ECurrentPhase
{
    INITIALIZATION,
    FIRST,
    SECOND
};

enum EInstructionType
{
    A_INSTRUCTION,
    L_INSTRUCTION,
    C_INSTRUCTION
};

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
};
