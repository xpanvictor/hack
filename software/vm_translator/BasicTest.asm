// ----: push pointer 1 ----
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 10 ----
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: lt ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
@R13
M=D
// ($lt)
@R13
D=M
@R14
D=D-M
@(TRUE)
D;JLT
@R15
M=0
(TRUE)
@R15
M=-1
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
