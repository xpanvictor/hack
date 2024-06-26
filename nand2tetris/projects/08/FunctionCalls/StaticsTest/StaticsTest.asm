// ----: // ** VM--CODE; x low level requirement ** ----

@256
D=A
@SP
M=D
@Sys.init
0;JMP

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
@StaticsTest.0
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
@StaticsTest.1
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

@StaticsTest.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push static 1 ----

@StaticsTest.1
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
@StaticsTest.0
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
@StaticsTest.1
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

@StaticsTest.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push static 1 ----

@StaticsTest.1
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


@Sys.init.return$1
D=A
@SP
A=M
M=D
@SP
M=M+1
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
@THIS
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
@THAT
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
// ----: #-# ARG = SP - 5 - n_arg ----


@5
D=A
@SP
D=A-M
@2
D=D-A
@ARG
M=D
// ----: #-#LCL = SP ----


@SP
A=M
D=M
@LCL
M=D
// ----: -> Goto - Class1.set ----

@Class1.set
0;JMP

// ----: label: Sys.init.return$1 ----

(Sys.init$Sys.init.return$1)
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


@Sys.init.return$2
D=A
@SP
A=M
M=D
@SP
M=M+1
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
@THIS
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
@THAT
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
// ----: #-# ARG = SP - 5 - n_arg ----


@5
D=A
@SP
D=A-M
@2
D=D-A
@ARG
M=D
// ----: #-#LCL = SP ----


@SP
A=M
D=M
@LCL
M=D
// ----: -> Goto - Class2.set ----

@Class2.set
0;JMP

// ----: label: Sys.init.return$2 ----

(Sys.init$Sys.init.return$2)
// ----: pop temp 0 ----


@SP
M=M-1
A=M
D=M
@5
M=D
// X_C:=> Call statement
// ----: #-# push retAddr by generating a label ----


@Sys.init.return$3
D=A
@SP
A=M
M=D
@SP
M=M+1
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
@THIS
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
@THAT
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
// ----: #-# ARG = SP - 5 - n_arg ----


@5
D=A
@SP
D=A-M
@0
D=D-A
@ARG
M=D
// ----: #-#LCL = SP ----


@SP
A=M
D=M
@LCL
M=D
// ----: -> Goto - Class1.get ----

@Class1.get
0;JMP

// ----: label: Sys.init.return$3 ----

(Sys.init$Sys.init.return$3)
// X_C:=> Call statement
// ----: #-# push retAddr by generating a label ----


@Sys.init.return$4
D=A
@SP
A=M
M=D
@SP
M=M+1
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
@THIS
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
@THAT
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
// ----: #-# ARG = SP - 5 - n_arg ----


@5
D=A
@SP
D=A-M
@0
D=D-A
@ARG
M=D
// ----: #-#LCL = SP ----


@SP
A=M
D=M
@LCL
M=D
// ----: -> Goto - Class2.get ----

@Class2.get
0;JMP

// ----: label: Sys.init.return$4 ----

(Sys.init$Sys.init.return$4)
// ----: label: WHILE ----

(Sys.init$WHILE)
// ----: -> Goto - WHILE ----

@WHILE
0;JMP


// Infinite end loop
(END)
@END
0;JMP

// CC=X
// V=1.0.0
