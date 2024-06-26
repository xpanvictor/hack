// ----: // ** VM--CODE; x low level requirement ** ----


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
// ----: label: LOOP_START ----
(LOOP_START)
// ----: push argument 0 ----
@ARG
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
// ----: push argument 0 ----
@ARG
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
// ----: push constant 1 ----
@1
D=A
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
// ----: pop argument 0 ----
@ARG
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
// ----: push argument 0 ----
@ARG
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
// ----: ?-> If Goto - LOOP_START ----
@SP
M=M-1
A=M
D=M
@LOOP_START
D;JGT

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

// Infinite end loop
(END)
@END
0;JMP

// CC=X
// V=1.0.0
