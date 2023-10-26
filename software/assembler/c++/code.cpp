#include "code.h"

string dest(string symb)
{
    string storeA = symb.find("A") == string::npos ? "0" : "1";
    string storeD = symb.find("D") == string::npos ? "0" : "1";
    string storeM = symb.find("M") == string::npos ? "0" : "1";
    string res = storeA + storeD + storeM;
    return res;
}
