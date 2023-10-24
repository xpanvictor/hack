#include "parser.h"

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
        // cout << "Stepping: " << assembly_parser.line_counter << endl;
        assembly_parser.advance();
        if (assembly_parser.instructionType() < 2)
        {
            cout << "Lvalue: " << assembly_parser.symbol() << endl;
        }
    }

    return 0;
}
