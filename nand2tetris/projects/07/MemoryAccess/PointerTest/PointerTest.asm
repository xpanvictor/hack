// ----: push constant 3030 ----
@3030
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop pointer 0 ----

@SP
M=M-1
A=M
D=M
@THIS
M=D
// ----: push constant 3040 ----
@3040
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop pointer 1 ----

@SP
M=M-1
A=M
D=M
@THAT
M=D
// ----: push constant 32 ----
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop this 2 ----
@THIS
D=M
@2
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
// ----: push constant 46 ----
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop that 6 ----
@THAT
D=M
@6
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
// ----: push pointer 0 ----
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push pointer 1 ----
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: add ----
// Arithmetic-logic 

@SP
M=M-1
A=M
D=M
@R13
M=D

@SP
M=M-1
A=M
D=M
@R14
M=D
// ($add)
@R13
D=M
@R14
D=M+D
@R15
M=D
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push this 2 ----
@THIS
D=M
@2
D=A+D
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: sub ----
// Arithmetic-logic 

@SP
M=M-1
A=M
D=M
@R13
M=D

@SP
M=M-1
A=M
D=M
@R14
M=D
// ($sub)
@R13
D=M
@R14
D=M-D
@R15
M=D
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push that 6 ----
@THAT
D=M
@6
D=A+D
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: add ----
// Arithmetic-logic 

@SP
M=M-1
A=M
D=M
@R13
M=D

@SP
M=M-1
A=M
D=M
@R14
M=D
// ($add)
@R13
D=M
@R14
D=M+D
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
