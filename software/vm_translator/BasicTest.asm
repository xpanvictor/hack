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

// ----: pop argument 1 ----

// ----: push constant 36 ----
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop this 6 ----

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

// ----: pop that 2 ----

// ----: push constant 510 ----
@510
D=A
@SP
A=M
M=D
@SP
M=M+1
// ----: pop temp 6 ----

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
// ----: add ----
add
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
sub
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
add
// ----: sub ----
sub
// ----: push temp 6 ----

