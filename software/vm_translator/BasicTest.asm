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
// ----: pop local 0 ----
@SP
A=M-1
D=M
@SP
M=M-1
@local
A=M+0
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
@SP
A=M-1
D=M
@SP
M=M-1
@argument
A=M+2
M=D
// ----: pop argument 1 ----
@SP
A=M-1
D=M
@SP
M=M-1
@argument
A=M+1
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
@SP
A=M-1
D=M
@SP
M=M-1
@this
A=M+6
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
@SP
A=M-1
D=M
@SP
M=M-1
@that
A=M+5
M=D
// ----: pop that 2 ----
@SP
A=M-1
D=M
@SP
M=M-1
@that
A=M+2
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
A=M-1
D=M
@SP
M=M-1
@temp
A=M+6
M=D
// ----: push local 0 ----
@LCL
A=M+0
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push that 5 ----
@THAT
A=M+5
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: not ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
@R13
A=M+0
M=D
// ($not)
@R15
M=!D
@R15
D=M
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
A=M+0
M=D
@SP
A=M-1
D=M
@SP
M=M-1
@R14
A=M+0
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
// ----: push argument 1 ----
@ARG
A=M+1
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: sub ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
@R13
A=M+0
M=D
@SP
A=M-1
D=M
@SP
M=M-1
@R14
A=M+0
M=D
// ($sub)
@R13
D=M
@R14
D=D-M
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
A=M+6
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push this 6 ----
@THIS
A=M+6
D=M
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
A=M+0
M=D
@SP
A=M-1
D=M
@SP
M=M-1
@R14
A=M+0
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
// ----: sub ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
@R13
A=M+0
M=D
@SP
A=M-1
D=M
@SP
M=M-1
@R14
A=M+0
M=D
// ($sub)
@R13
D=M
@R14
D=D-M
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
/@SP
A=M
M=D
@SP
M=M+1
