// ----: push constant 10 ----
@10
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
// ----: push constant 21 ----
@21
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 22 ----
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop argument 2 ----
@ARG
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
// ----: pop argument 1 ----
@ARG
D=M
@1
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
// ----: push constant 36 ----
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop this 6 ----
@THIS
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
// ----: push constant 42 ----
@42
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 45 ----
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop that 5 ----
@THAT
D=M
@5
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
// ----: pop that 2 ----
@THAT
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
// ----: push constant 510 ----
@510
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop temp 6 ----

@SP
M=M-1
A=M
D=M
@11
M=D
// ----: push local 0 ----
@LCL
D=M
@0
D=A+D
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push that 5 ----
@THAT
D=M
@5
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
// ----: push argument 1 ----
@ARG
D=M
@1
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
// ----: push this 6 ----
@THIS
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
// ----: push this 6 ----
@THIS
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
// ----: push temp 6 ----
@11
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
