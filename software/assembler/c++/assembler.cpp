#include "parser.h"
#include "code.h"
#include <bits/stdc++.h>

#define sum(a, b) (a + b);

typedef int feet;

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        // some error handling fts
        fprintf(stderr, "usage: assembler <assembly file path>\n");
        exit(1);
    }
    char *assembly_file_path = argv[1];
    feet distance = 3.4;
    feet plus10 = sum(10, distance);
    cout << "Assembler that ignores symbols!" << plus10 << endl;

    Parser assembly_parser = Parser(assembly_file_path);

    // First pass; symbol table compilation
    assembly_parser.resetParser(FIRST_PASS);
    int current_free_pos = 16;
    while (assembly_parser.hasMoreLines())
    {
        assembly_parser.advance();
        if (assembly_parser.instructionType() < 2)
        {
            // LValue
            string curr_symbol = assembly_parser.symbol();
            // Check if symbol is a number already
            bool isSymbolInteger = CodeModule::isInteger(curr_symbol);
            if (
                isSymbolInteger &&
                assembly_parser.symbol_table.find(curr_symbol) == assembly_parser.symbol_table.end())
            {
                // symbol doesn't exist, addEntry
                assembly_parser.symbol_table.insert(make_pair(curr_symbol, current_free_pos));
                current_free_pos++;
            }
        }
    }

    // Second pass; symbol table use
    assembly_parser.resetParser(SECOND_PASS);
    while (assembly_parser.hasMoreLines())
    {
        string assembly_binary_code;
        // cout << "Stepping: " << assembly_parser.instructionType() << endl;
        assembly_parser.advance();
        if (assembly_parser.instructionType() < 2)
        {
            string curr_symbol = assembly_parser.symbol();
            int iCurr_symbol;
            string binary_symbol_value;
            if (!CodeModule::isInteger(curr_symbol))
            {
                auto itrSymbolValue = assembly_parser.symbol_table.find(curr_symbol);
                iCurr_symbol = itrSymbolValue->second;
            }
            else
            {
                iCurr_symbol = std::stoi(curr_symbol);
                cout << iCurr_symbol << endl;
            }
            binary_symbol_value = bitset<15>(iCurr_symbol).to_string();
            assembly_binary_code = "0" + binary_symbol_value;
        }
        else
        {
            string CINCODE = "111";
            string compCode = CodeModule::comp(assembly_parser.comp());
            string destCode = CodeModule::dest(assembly_parser.dest());
            string jumpCode = CodeModule::jump(assembly_parser.jump());

            assembly_binary_code = CINCODE + compCode + destCode + jumpCode;
        }
        assembly_parser.writeBinaryLine(assembly_binary_code);
    }

    cout << "Binary code written to " << assembly_parser.binay_file_path << endl;

    return 0;
}