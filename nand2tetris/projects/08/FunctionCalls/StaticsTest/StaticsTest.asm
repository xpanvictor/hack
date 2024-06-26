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
// ----: // ** VM--CODE; x low level requirement ** ----

// ** New file init: {}
// X_C:=> Function statement
// ----: Function init - Class1.set ----

(Class1.set)

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
// ----: pop static 0 ----


@SP
M=M-1
A=M
D=M
@Class1.0
M=D
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
// ----: pop static 1 ----


@SP
M=M-1
A=M
D=M
@Class1.1
M=D
// ----: push constant 0 ----

@0
D=A
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
// ----: Function init - Class1.get ----

(Class1.get)

// ----: push static 0 ----

@Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push static 1 ----

@Class1.1
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
// ----: // ** VM--CODE; x low level requirement ** ----

// ** New file init: {}
// X_C:=> Function statement
// ----: Function init - Class2.set ----

(Class2.set)

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
// ----: pop static 0 ----


@SP
M=M-1
A=M
D=M
@Class2.0
M=D
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
// ----: pop static 1 ----


@SP
M=M-1
A=M
D=M
@Class2.1
M=D
// ----: push constant 0 ----

@0
D=A
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
// ----: Function init - Class2.get ----

(Class2.get)

// ----: push static 0 ----

@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push static 1 ----

@Class2.1
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
// ----: // ** VM--CODE; x low level requirement ** ----

// ** New file init: {}
// X_C:=> Function statement
// ----: Function init - Sys.init ----

(Sys.init)

// ----: push constant 6 ----

@6
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
@2
D=D-A
@ARG
M=D
// ----: #-# LCL = SP ----


@SP
D=M
@LCL
M=D
// ----: #-# fn Class1.set goto ----


@Class1.set
0;JMP
// ----: label: return.2 ----

(Sys.init$return.2)
// ----: pop temp 0 ----


@SP
M=M-1
A=M
D=M
@5
M=D
// ----: push constant 23 ----

@23
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 15 ----

@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// X_C:=> Call statement
// ----: #-# push retAddr by generating a label ----

@Sys.init$return.3
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
@2
D=D-A
@ARG
M=D
// ----: #-# LCL = SP ----


@SP
D=M
@LCL
M=D
// ----: #-# fn Class2.set goto ----


@Class2.set
0;JMP
// ----: label: return.3 ----

(Sys.init$return.3)
// ----: pop temp 0 ----


@SP
M=M-1
A=M
D=M
@5
M=D
// X_C:=> Call statement
// ----: #-# push retAddr by generating a label ----

@Sys.init$return.4
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
// ----: #-# fn Class1.get goto ----


@Class1.get
0;JMP
// ----: label: return.4 ----

(Sys.init$return.4)
// X_C:=> Call statement
// ----: #-# push retAddr by generating a label ----

@Sys.init$return.5
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
// ----: #-# fn Class2.get goto ----


@Class2.get
0;JMP
// ----: label: return.5 ----

(Sys.init$return.5)
// ----: label: WHILE ----

(Sys.init$WHILE)
// ----: -> Goto - Sys.init$WHILE ----

@Sys.init$WHILE
0;JMP


// Infinite end loop
(END)
@END
0;JMP

// CC=X
// V=1.0.0
