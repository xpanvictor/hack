// ----: // ** VM--CODE; x low level requirement ** ----

@256
D=A
@SP
M=D
@Sys.init
0;JMP

// X_C:=> Function statement
// ----: Function init - SimpleFunction.test ----

(SimpleFunction.test)

// ----: push constant 0 ----

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 0 ----

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push local 0 ----

@LCL
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push local 1 ----

@LCL
D=M
@1
D=D+A
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
// ----: not ----

// Arithmetic-logic 

@SP
M=M-1
A=M
D=M
@R13
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
// ----: push argument 0 ----

@ARG
D=M
@0
D=D+A
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
D=D+A
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
// X_C:=> Return command
// ----: #-# frame = LCL ----


@LCL
D=M
@FRAME
M=D
// ----: #-# retAddr = *(frame - 5) ----


@FRAME
D=M
@5
A=D-A
D=M
@retAddr
M=D
@ARG
D=M
@0
D=D+A
@R15
M=D
@SP
M=M-1
A=M
D=M
@R15
A=M
M=D
// ----: #-# SP=ARG+1 ----


@ARG
D=M+1
@SP
M=D
// ----: #-# THAT=*(FRAME-1) ----


@FRAME
A=M-1
D=M
@THAT
M=D
// ----: #-# THIS=*(FRAME-2) ----


@FRAME
D=M
@2
A=D-A
D=M
@THIS
M=D
// ----: #-# ARG=*(FRAME-3) ----


@FRAME
D=M
@3
A=D-A
D=M
@ARG
M=D
// ----: #-# LCL=*(FRAME-4) ----


@FRAME
D=M
@4
A=D-A
D=M
@LCL
M=D
// ----: #-# goto retAddr ----


@retAddr
A=M
0;JMP

// Infinite end loop
(END)
@END
0;JMP

// CC=X
// V=1.0.0
