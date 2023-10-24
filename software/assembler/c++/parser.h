#include <fstream>
#include <iostream>

#pragma once

using namespace std;

class Parser
{
private:
    /* data */
    const char *filepath;
    ifstream assembly_file_reader;
    ofstream binary_file_writer;
    string assembly_content;

public:
    Parser(const char *filepath);
    ~Parser(void);
    void initialization_phase(void);

    static int counter; // not really necessary to use static
};
