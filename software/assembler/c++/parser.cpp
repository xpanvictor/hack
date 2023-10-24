
#include "parser.h"

Parser::Parser(const char *filepath)
{
    cout << "Reading assembly file '" << filepath << "'" << endl;
    assembly_content = "";

    try
    {
        assembly_file_reader.open(filepath, ios::in);
        if (assembly_file_reader.is_open())
        {
            assembly_content = string(istreambuf_iterator<char>(assembly_file_reader), istreambuf_iterator<char>());

            cout << assembly_content << endl;
        }
        else
        {
            cerr << "Couldn't open file \"" << filepath << "\"" << endl;
        }
    }
    catch (const exception &e)
    {
        std::cerr << "Error: " << e.what() << '\n';
    }
}

void Parser::initialization_phase()
{
}

Parser::~Parser(void)
{
    assembly_file_reader.close();
    binary_file_writer.close();
}
