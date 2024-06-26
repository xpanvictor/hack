// ----: // ** VM--CODE; x low level requirement ** ----

@256
D=A
@SP
M=D
// X_C:=> Call statement
// ----: #-# push retAddr by generating a label ----

@return.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment LCL ----

@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment ARG ----

@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment THIS ----

@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment THAT ----

@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# ARG = SP - 5 - n_arg ----


@5
D=A
@SP
D=M-D
@0
D=D-A
@ARG
M=D
// ----: #-# LCL = SP ----


@SP
D=M
@LCL
M=D
// ----: #-# fn Sys.init goto ----


@Sys.init
0;JMP
// ----: label: return.1 ----

(return.1)
// X_C:=> Function statement
// ----: Function init - Sys.init ----

(Sys.init)

// ----: push constant 4000 ----

@4000
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
// ----: push constant 5000 ----

@5000
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
// X_C:=> Call statement
// ----: #-# push retAddr by generating a label ----

@Sys.init$return.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment LCL ----

@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment ARG ----

@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment THIS ----

@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment THAT ----

@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# ARG = SP - 5 - n_arg ----


@5
D=A
@SP
D=M-D
@0
D=D-A
@ARG
M=D
// ----: #-# LCL = SP ----


@SP
D=M
@LCL
M=D
// ----: #-# fn Sys.main goto ----


@Sys.main
0;JMP
// ----: label: return.2 ----

(Sys.init$return.2)
// ----: pop temp 1 ----


@SP
M=M-1
A=M
D=M
@6
M=D
// ----: label: LOOP ----

(Sys.init$LOOP)
// ----: -> Goto - Sys.init$LOOP ----

@Sys.init$LOOP
0;JMP

// X_C:=> Function statement
// ----: Function init - Sys.main ----

(Sys.main)

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
// ----: push constant 0 ----

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 4001 ----

@4001
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
// ----: push constant 5001 ----

@5001
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
// ----: push constant 200 ----

@200
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop local 1 ----

@LCL
D=M
@1
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
// ----: push constant 40 ----

@40
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop local 2 ----

@LCL
D=M
@2
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
// ----: push constant 6 ----

@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop local 3 ----

@LCL
D=M
@3
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
// ----: push constant 123 ----

@123
D=A
@SP
A=M
M=D
@SP
M=M+1
// X_C:=> Call statement
// ----: #-# push retAddr by generating a label ----

@Sys.main$return.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment LCL ----

@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment ARG ----

@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment THIS ----

@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# pushing segment THAT ----

@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: #-# ARG = SP - 5 - n_arg ----


@5
D=A
@SP
D=M-D
@1
D=D-A
@ARG
M=D
// ----: #-# LCL = SP ----


@SP
D=M
@LCL
M=D
// ----: #-# fn Sys.add12 goto ----


@Sys.add12
0;JMP
// ----: label: return.3 ----

(Sys.main$return.3)
// ----: pop temp 0 ----


@SP
M=M-1
A=M
D=M
@5
M=D
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
// ----: push local 2 ----

@LCL
D=M
@2
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push local 3 ----

@LCL
D=M
@3
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push local 4 ----

@LCL
D=M
@4
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
// X_C:=> Function statement
// ----: Function init - Sys.add12 ----

(Sys.add12)

// ----: push constant 4002 ----

@4002
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
// ----: push constant 5002 ----

@5002
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
// ----: push constant 12 ----

@12
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
