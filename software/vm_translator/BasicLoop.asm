// ----: push constant 0 ----
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop local 0 ----
@LCL
D=M
@0
D=A+D
@R15
M=D
@SP
M=M-1
A=M
D=M
@R15
A=M
M=D

// Infinite end loop
(END)
@END
0;JMP

// CC=X
// V=1.0.0
