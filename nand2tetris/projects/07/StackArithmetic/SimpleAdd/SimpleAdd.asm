// ----: push constant 7 ----
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 8 ----
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: add ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
@R13
M=D
@SP
A=M-1
D=M
@SP
M=M-1
@R14
M=D
// ($add)
@R13
D=M
@R14
D=D+M
@R15
M=D
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1

// Infinite end loop
(END)
@END
0;JMP

// CC=X
// V=1.0.0
