// ----: pop pointer 0 ----
@SP
A=M-1
D=M
@SP
M=M-1
@THIS
M=D

// Infinite end loop
(END)
@END
0;JMP

// CC=X
// V=1.0.0
