#pragma once
#include <iostream>
#include <unordered_map>

using namespace std;

namespace CodeModule
{
    string dest(string destCode);
    /// ------------> Structure of JumpCodes
    //     {"JGT", "001"},
    //     {"JEQ", "010"},
    //     {"JGE", "011"},
    //     {"JLT", "100"},
    //     {"JNE", "101"},
    //     {"JLE", "110"},
    //     {"JMP", "111"},
    //     {"NULL", "000"},
    string jump(string jumpCode);

    /// ------------> Structure of CompCodes
    //     {"0", "101010"},
    //     {"1", "111111"},
    //     {"-1", "111010"},
    //     {"D", "001100"},
    //     {"A", "110000"},
    //     {"!D", "001101"},
    //     {"!A", "110001"},
    //     {"-D", "001111"},
    //     {"-A", "110011"},
    //     {"D+1", "011111"},
    //     {"A+1", "110111"},
    //     {"D-1", "001110"},
    //     {"A-1", "110010"},
    //     {"D+A", "000010"},
    //     {"D-A", "010011"},
    //     {"A-D", "000111"},
    //     {"D&A", "000000"},
    //     {"D|A", "010101"},
    string comp(string compCode);
}
