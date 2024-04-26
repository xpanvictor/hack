// ----: push constant 17 ----
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 17 ----
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: eq ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
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
                                //($eq)
@TRUE_1
D;JEQ
@R15
M=0
@CONTINUE_1
0;JMP
(TRUE_1)
@R15
M=-1
(CONTINUE_1)
                            
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 17 ----
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 16 ----
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: eq ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
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
                                //($eq)
@TRUE_2
D;JEQ
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
// ----: push constant 16 ----
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 17 ----
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: eq ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
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
                                //($eq)
@TRUE_3
D;JEQ
@R15
M=0
@CONTINUE_3
0;JMP
(TRUE_3)
@R15
M=-1
(CONTINUE_3)
                            
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 892 ----
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 891 ----
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: lt ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
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
@TRUE_4
D;JLT
@R15
M=0
@CONTINUE_4
0;JMP
(TRUE_4)
@R15
M=-1
(CONTINUE_4)
                            
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 891 ----
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 892 ----
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: lt ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
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
@TRUE_5
D;JLT
@R15
M=0
@CONTINUE_5
0;JMP
(TRUE_5)
@R15
M=-1
(CONTINUE_5)
                            
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 891 ----
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 891 ----
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: lt ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
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
@TRUE_6
D;JLT
@R15
M=0
@CONTINUE_6
0;JMP
(TRUE_6)
@R15
M=-1
(CONTINUE_6)
                            
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 32767 ----
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 32766 ----
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: gt ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
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
                                //($gt)
@TRUE_7
D;JGT
@R15
M=0
@CONTINUE_7
0;JMP
(TRUE_7)
@R15
M=-1
(CONTINUE_7)
                            
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 32766 ----
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 32767 ----
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: gt ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
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
                                //($gt)
@TRUE_8
D;JGT
@R15
M=0
@CONTINUE_8
0;JMP
(TRUE_8)
@R15
M=-1
(CONTINUE_8)
                            
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 32766 ----
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 32766 ----
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: gt ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
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
                                //($gt)
@TRUE_9
D;JGT
@R15
M=0
@CONTINUE_9
0;JMP
(TRUE_9)
@R15
M=-1
(CONTINUE_9)
                            
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 57 ----
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 31 ----
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 53 ----
@53
D=A
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
M=D
@SP
A=M-1
D=M
@SP
M=M-1
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
// ----: push constant 112 ----
@112
D=A
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
M=D
@SP
A=M-1
D=M
@SP
M=M-1
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
// ----: neg ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
@R13
M=D
// ($neg)
@R15
M=-D
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: and ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
@R13
M=D
@SP
A=M-1
D=M
@SP
M=M-1
@R14
M=D
// ($and)
@R13
D=M
@R14
D=M&D
@R15
M=D
@R15
D=M
@SP
A=M
M=D
@SP
M=M+1
// ----: push constant 82 ----
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: or ----
// Arithmetic-logic 
@SP
A=M-1
D=M
@SP
M=M-1
@R13
M=D
@SP
A=M-1
D=M
@SP
M=M-1
@R14
M=D
// ($or)
@R13
D=M
@R14
D=M|D
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
A=M-1
D=M
@SP
M=M-1
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

// Infinite end loop
(END)
@END
0;JMP

// CC=X
// V=1.0.0
