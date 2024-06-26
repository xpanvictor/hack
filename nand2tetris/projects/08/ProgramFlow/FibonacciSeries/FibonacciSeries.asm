// ----: // ** VM--CODE; x low level requirement ** ----

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
// ----: pop pointer 1 ----

@SP
M=M-1
A=M
D=M
@THAT
M=D
// ----: push constant 0 ----
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop that 0 ----
@THAT
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
// ----: push constant 1 ----
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop that 1 ----
@THAT
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
// ----: push constant 2 ----
@2
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
// ----: label: MAIN_LOOP_START ----
(MAIN_LOOP_START)
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
// ----: ?-> If Goto - COMPUTE_ELEMENT ----
@SP
M=M-1
A=M
D=M
@COMPUTE_ELEMENT
D;JGT

// ----: -> Goto - END_PROGRAM ----
@END_PROGRAM
0;JMP

// ----: label: COMPUTE_ELEMENT ----
(COMPUTE_ELEMENT)
// ----: push that 0 ----
@THAT
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
// ----: push that 1 ----
@THAT
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
// ----: push pointer 1 ----
@THAT
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
// ----: pop pointer 1 ----

@SP
M=M-1
A=M
D=M
@THAT
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
// ----: -> Goto - MAIN_LOOP_START ----
@MAIN_LOOP_START
0;JMP

// ----: label: END_PROGRAM ----
(END_PROGRAM)

// Infinite end loop
(END)
@END
0;JMP

// CC=X
// V=1.0.0
