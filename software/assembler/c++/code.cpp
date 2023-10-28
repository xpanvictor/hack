#include "code.h"

unordered_map<string, string> TJumpCodes = {
    {"JGT", "001"},
    {"JEQ", "010"},
    {"JGE", "011"},
    {"JLT", "100"},
    {"JNE", "101"},
    {"JLE", "110"},
    {"JMP", "111"},
    {"NULL", "000"},
};

string CodeModule::dest(string destCode)
{
    string storeA = destCode.find("A") == string::npos ? "0" : "1";
    string storeD = destCode.find("D") == string::npos ? "0" : "1";
    string storeM = destCode.find("M") == string::npos ? "0" : "1";
    string res = storeA + storeD + storeM;
    return res;
}

namespace CodeModule
{

    string comp(string compCode)
    {
        string actOnM = compCode.find("M") == string::npos ? "1" : "0";
        return "";
    }

    string jump(string jumpCode)
    {
        string res;
        auto jumpCodeItr = TJumpCodes.find(jumpCode);
        if (jumpCodeItr == TJumpCodes.end())
            res = "000";
        else
            res = jumpCodeItr->second;

        return res;
    }

}