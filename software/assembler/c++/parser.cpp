
#include "parser.h"

Parser::Parser(const char *filepath)
{
    std::cout << "Reading assembly file '" << filepath << "'" << endl;
    assembly_content = "";

    try
    {
        assembly_file_reader.open(filepath, ios::in);
        if (assembly_file_reader.is_open())
        {
            // assembly_content = string(istreambuf_iterator<char>(assembly_file_reader), istreambuf_iterator<char>());
            assembly_file_line_size = 0;
            std::string line;
            // TODO: double iteration; move to assembly_content generation
            while (std::getline(assembly_file_reader, line))
            {
                assembly_file_line_size += 1;
                assembly_content += line + '\n';
            }
            this->initialization_phase();
        }
        else
        {
            cerr << "Couldn't open file \"" << filepath << "\"" << endl;
            return;
        }
    }
    catch (const exception &e)
    {
        std::cerr << "Error: " << e.what() << '\n';
    }

    current_phase = INITIALIZATION;
    cout << "File length: " << assembly_file_line_size << endl;
}

void Parser::initialization_phase()
{
    std::cout << "Initialization phase..." << endl;
    this->symbol_table = {
        {"R0", 0},
        {"R1", 1},
        {"R2", 2},
        {"R3", 3},
        {"R4", 4},
        {"R5", 5},
        {"R6", 6},
        {"R7", 7},
        {"R8", 8},
        {"R9", 9},
        {"R10", 10},
        {"R11", 11},
        {"R12", 12},
        {"R13", 13},
        {"R14", 14},
        {"R15", 15},
        {"SP", 0},
        {"LCL", 1},
        {"ARG", 2},
        {"THIS", 3},
        {"THAT", 4},
        {"SCREEN", 16384},
        {"KBD", 24576},
    };
    std::cout << "Symbol table initialized" << endl;
}

int Parser::first_pass(void)
{
    return 0;
}

Parser::~Parser(void)
{
    assembly_file_reader.close();
    binary_file_writer.close();
}

bool Parser::hasMoreLines(void)
{
    return current_pos < assembly_content.length();
}

void Parser::advance(void)
{
    while (hasMoreLines())
    {
        int endPos = assembly_content.find('\n', current_pos);
        if (endPos == std::string::npos)
            endPos = assembly_content.length();

        // Ignore whitespace and comment
        current_line = assembly_content.substr(current_pos, endPos - current_pos);
        line_counter++;

        bool isComment = current_line.find("//") == 0;
        bool isWhiteSpace = current_line.find_first_not_of(" \t\n\r") > 0;

        // change current position
        current_pos = endPos + 1;
        if (isComment || isWhiteSpace)
            continue;

        break;
    }
}

EInstructionType Parser::instructionType(void)
{
    if (current_line.find("@") != string::npos)
    {
        return A_INSTRUCTION;
    }
    else if (current_line.find("(") != string::npos)
    {
        return L_INSTRUCTION;
    }
    else
        return C_INSTRUCTION;
}

string Parser::symbol(void)
{
    EInstructionType current_instruction_type = instructionType();
    if (current_instruction_type > 1)
        throw "InvalidType";
    if (current_instruction_type == A_INSTRUCTION)
        return current_line.substr(1);
    else
        return current_line.substr(1, current_line.length() - 3);
}

string Parser::dest(void)
{
    if (instructionType() != C_INSTRUCTION)
        throw "InvalidType";

    int eq_sign_pos = current_line.find('=');
    if (eq_sign_pos == string::npos)
        return "";

    return current_line.substr(0, eq_sign_pos);
}

string Parser::comp(void)
{
    if (instructionType() != C_INSTRUCTION)
        throw "InvalidType";

    int eq_sign_pos = current_line.find('=');
    int semicolon_sign_pos = current_line.find(';');

    bool neqp = eq_sign_pos == string::npos;
    bool nscp = semicolon_sign_pos == string::npos;

    if (nscp)
        semicolon_sign_pos = current_line.length();
    if (neqp)
        eq_sign_pos = semicolon_sign_pos;

    return current_line.substr(eq_sign_pos + 1, semicolon_sign_pos - eq_sign_pos);
}

string Parser::jump(void)
{
    if (instructionType() != C_INSTRUCTION)
        throw "InvalidType";

    int semicolon_sign_pos = current_line.find(';');
    if (semicolon_sign_pos == string::npos)
        return "N";

    return current_line.substr(semicolon_sign_pos + 1);
}
