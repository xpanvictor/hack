#pragma once
#include <iostream>
#include <unordered_map>

using namespace std;

/// ------------> Structure of JumpCodes
//     {"JGT", "001"},
//     {"JEQ", "010"},
//     {"JGE", "011"},
//     {"JLT", "100"},
//     {"JNE", "101"},
//     {"JLE", "110"},
//     {"JMP", "111"},
//     {"NULL", "000"},

namespace CodeModule
{
    string dest(string destCode);
    string jump(string jumpCode);
    string comp(string compCode);
}
