// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@SCREEN
D=A
@p
A=D
@n
M=0
@8190
D=A
@MAX
M=D


(WHITE)
    @n
    M=0
(PAINT_WHITE)
    // goto black if keyboard is greater than 0
    @KBD
    D=M
    @BLACK
    D;JGT

    // *(SCREEN + 16) = -1
    @SCREEN
    D=A
    @n
    A=D+M
    M=0
    // n += 16
    @MAX
    D=M
    @n
    D=D-M
    @PAINT_WHITE
    D;JLT
    @n
    M=M+1
    @PAINT_WHITE
    0;JEQ


(BLACK)
    @n
    M=0
(PAINT_BLACK)
    // Go to white if keyboard is 0
    @KBD
    D=M
    @WHITE
    D;JEQ

    // *(SCREEN + 16) = -1
    @SCREEN
    D=A
    @n
    A=D+M
    M=-1
    // if n < max n += 16 
     @MAX
    D=M
    @n
    D=D-M
    @PAINT_BLACK
    D;JLT
    @n
    M=M+1
    @PAINT_BLACK
    0;JEQ
