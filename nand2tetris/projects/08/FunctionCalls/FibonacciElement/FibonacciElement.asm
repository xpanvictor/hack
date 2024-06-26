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
// ----: Function init - Main.fibonacci ----

(Main.fibonacci)

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
// ----: push constant 2 ----

@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: lt ----

// Arithmetic-logic 

@SP
M=M-1
A=M
D=M
@R13
M=D

                                // ($--logic-section)
@R13
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
                                //($lt)
@TRUE_2
D;JLT
@R15
M=0
@CONTINUE_2
0;JMP
(TRUE_2)
@R15
M=-1
(CONTINUE_2)
                            
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: ?-> If Goto - Main.fibonacci$IF_TRUE ----

@SP
M=M-1
A=M
D=M
@Main.fibonacci$IF_TRUE
D;JLT

// ----: -> Goto - Main.fibonacci$IF_FALSE ----

@Main.fibonacci$IF_FALSE
0;JMP

// ----: label: IF_TRUE ----

(Main.fibonacci$IF_TRUE)
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
// ----: label: IF_FALSE ----

(Main.fibonacci$IF_FALSE)
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
// X_C:=> Call statement
// ----: #-# push retAddr by generating a label ----

@Main.fibonacci$return.3
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
// ----: #-# fn Main.fibonacci goto ----


@Main.fibonacci
0;JMP
// ----: label: return.3 ----

(Main.fibonacci$return.3)
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
// X_C:=> Call statement
// ----: #-# push retAddr by generating a label ----

@Main.fibonacci$return.4
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
// ----: #-# fn Main.fibonacci goto ----


@Main.fibonacci
0;JMP
// ----: label: return.4 ----

(Main.fibonacci$return.4)
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
// ----: Function init - Sys.init ----

(Sys.init)

// ----: push constant 4 ----

@4
D=A
@SP
A=M
M=D
@SP
M=M+1
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
@1
D=D-A
@ARG
M=D
// ----: #-# LCL = SP ----


@SP
D=M
@LCL
M=D
// ----: #-# fn Main.fibonacci goto ----


@Main.fibonacci
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
