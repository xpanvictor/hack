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
// ----: eq ----
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
D=M-D
@SP
M=M-1
// ($eq)
@TRUE
D;JEQ
@R15
M=0
@CONTINUE
0;JMP
(TRUE)
@R15
M=-1
(CONTINUE)
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
