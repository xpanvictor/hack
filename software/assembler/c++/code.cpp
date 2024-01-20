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

unordered_map<string, string> TCompCodes = {
    {"0", "101010"},
    {"1", "111111"},
    {"-1", "111010"},
    {"D", "001100"},
    {"A", "110000"},
    {"!D", "001101"},
    {"!A", "110001"},
    {"-D", "001111"},
    {"-A", "110011"},
    {"D+1", "011111"},
    {"A+1", "110111"},
    {"D-1", "001110"},
    {"A-1", "110010"},
    {"D+A", "000010"},
    {"D-A", "010011"},
    {"A-D", "000111"},
    {"D&A", "000000"},
    {"D|A", "010101"},
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
    /// acccccc
    string comp(string compCode)
    {
        string res;
        // cout << compCode << endl;
        auto mRegisterPoint = compCode.find("M");
        string a = "0";
        if (mRegisterPoint != string::npos)
        {
            a = "1";
            compCode[mRegisterPoint] = 'A';
        }
        res = a;
        // search from comp codes
        auto itrCompCode = TCompCodes.find(compCode);
        if (itrCompCode == TCompCodes.end())
        {
            throw std::invalid_argument("Assembly code not found");
        }
        else
            res += itrCompCode->second;

        return res;
    }

    string jump(string jumpCode)
    {
        string res;
        auto itrJumpCode = TJumpCodes.find(jumpCode);
        if (itrJumpCode == TJumpCodes.end())
            res = "000";
        else
            res = itrJumpCode->second;

        return res;
    }

    bool isInteger(string val)
    {
        try
        {
            stoi(val);
            return true;
        }
        catch (const std::exception &e)
        {
            return false;
        }
    }
}