#include "parser.h"
#include "code.h"

#define sum(a, b) (a + b);

typedef int feet;

int main()
{
    feet distance = 3.4;
    feet plus10 = sum(10, distance);
    cout << "Basic assembler that ignores symbols!" << plus10 << endl;

    Parser assembly_parser = Parser("Add.asm");

    while (assembly_parser.hasMoreLines())
    {
        string assembly_binary_code;
        // cout << "Stepping: " << assembly_parser.instructionType() << endl;
        assembly_parser.advance();
        if (assembly_parser.instructionType() < 2)
        {
            assembly_binary_code = "0" + assembly_parser.symbol();
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
