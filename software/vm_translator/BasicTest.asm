// ----: pop local 0 ----

// ----: push constant 21 ----
@
A=M+21
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: push constant 22 ----
@
A=M+22
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: pop argument 2 ----

// ----: pop argument 1 ----

// ----: push constant 36 ----
@
A=M+36
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: pop this 6 ----

// ----: push constant 42 ----
@
A=M+42
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: push constant 45 ----
@
A=M+45
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: pop that 5 ----

// ----: pop that 2 ----

// ----: push constant 510 ----
@
A=M+510
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: pop temp 6 ----

// ----: push local 0 ----
@LCL
A=M+0
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: push that 5 ----
@
A=M+5
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: add ----
add
// ----: push argument 1 ----
@ARG
A=M+1
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: sub ----
sub
// ----: push this 6 ----
@
A=M+6
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: push this 6 ----
@
A=M+6
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: add ----
add
// ----: sub ----
sub
// ----: push temp 6 ----
@
A=M+6
D=M
@SP
A=M
M=D@SP
M=M+1
// ----: add ----
add
