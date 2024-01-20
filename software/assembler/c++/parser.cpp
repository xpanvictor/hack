
#include "parser.h"

string stripNonCode(const string &raw)
{
    if (!raw.empty())
    {
        regex nonCodePattern("(\\s|\\t)+|//.*$");
        string strippedWhitespace = regex_replace(raw, nonCodePattern, "");

        size_t comment_point = strippedWhitespace.find("//");
        if (comment_point != string::npos)
            return strippedWhitespace.substr(0, comment_point);
        else
            return strippedWhitespace;
    }
    return raw;
}

Parser::Parser(const char *filepath)
{
    std::cout << "Reading assembly file '" << filepath << "'" << endl;
    assembly_content = "";

    string filename = (string)filepath;
    auto extPos = filename.find_last_of(".");
    binay_file_path = filename.substr(0, extPos) + ".hack";

    try
    {
        assembly_file_reader.open(filepath, ios::in);
        // get writer ready
        binary_file_writer.open(binay_file_path, ios::trunc);
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
            cerr << "<--Couldn't open file \"" << filepath << "\"" << endl;
            return;
        }
    }
    
    catch (const exception &e)
    {
        std::cerr << "<--Error: " << e.what() << '\n';
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

void Parser::resetParser(ECurrentPhase new_phase)
{
    current_pos = line_counter = assembly_counter = 0;
    current_phase = new_phase;
    cout << "Current phase: " << current_phase << endl;
}

bool Parser::isValidLine() const {
    bool isComment = current_line.find("//") == 0;
    bool isWhiteSpace = current_line.find_first_not_of(" \t\n\r") > 0;
    return !(isComment || isWhiteSpace);
}

void Parser::advance()
{

    int endPos = assembly_content.find('\n', current_pos);
    if (endPos == std::string::npos)
        endPos = assembly_content.length();

    // Ignore whitespace and comment
    string rawLine = assembly_content.substr(current_pos, endPos - current_pos);
    current_line = stripNonCode(rawLine);
    // cout << current_line << endl;
    line_counter++;

    // change current position
    current_pos = endPos + 1;

    if (hasMoreLines() && !this->isValidLine()) {
        this->advance();
    }
}

EInstructionType Parser::instructionType(void)
{
    if (current_line.find('@') != string::npos)
    {
        return A_INSTRUCTION;
    }
    else if (current_line.find('(') != string::npos)
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
        throw std::invalid_argument("symbol can't be called for C Instruction");
    if (current_instruction_type == A_INSTRUCTION)
        return current_line.substr(1);
    else
        return current_line.substr(1, current_line.length() - 3);
}

string Parser::dest(void)
{
    if (instructionType() != C_INSTRUCTION)
        throw std::invalid_argument("can't get dest for A Instruction");

    int eq_sign_pos = current_line.find('=');
    if (eq_sign_pos == string::npos)
        return "";

    return current_line.substr(0, eq_sign_pos);
}

string Parser::comp()
{
    if (instructionType() != C_INSTRUCTION)
        throw std::invalid_argument("can't get comp of an A Instruction");

    int eq_sign_pos = current_line.find('=');
    int semicolon_sign_pos = current_line.find(';');

    bool neqp = eq_sign_pos == string::npos;
    bool nscp = semicolon_sign_pos == string::npos;

    if (nscp)
        semicolon_sign_pos = current_line.length();
    if (neqp)
    {
        eq_sign_pos = -1;
        semicolon_sign_pos -= 1;
    }

    return current_line.substr(eq_sign_pos + 1, semicolon_sign_pos - eq_sign_pos);
}

string Parser::jump(void)
{
    if (instructionType() != C_INSTRUCTION)
        throw std::invalid_argument("jump called for A Instruction");

    int semicolon_sign_pos = current_line.find(';');
    if (semicolon_sign_pos == string::npos)
        return "NUL";

    return current_line.substr(semicolon_sign_pos + 1);
}

void Parser::writeBinaryLine(string binary_line)
{
    if (binary_line.empty())
        return;
    binary_line += "\n";
    binary_file_writer << binary_line;
}
