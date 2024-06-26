// ----: // ** VM--CODE; x low level requirement ** ----
@256
D=A
SP
M=D
@Sys.init
0;JMP

// ----: push constant 111 ----
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 333 ----
@333
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 888 ----
@888
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop static 8 ----

@SP
M=M-1
A=M
D=M
@StaticTest.8
M=D
// ----: pop static 3 ----

@SP
M=M-1
A=M
D=M
@StaticTest.3
M=D
// ----: pop static 1 ----

@SP
M=M-1
A=M
D=M
@StaticTest.1
M=D
// ----: push static 3 ----
@StaticTest.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push static 1 ----
@StaticTest.1
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
// ----: push static 8 ----
@StaticTest.8
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
