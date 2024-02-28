// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(START)
//-1 = 11111111111111
// 0 = 00000000000000
// JGT (JUMP - GREATER THAN) 
// JEQ (Jump - EQUAL)
// JNE (JUMP - NOT EQUAL)
// JLE (JUMP - LESS THAN)

@0
D=A
@screen
M=D
@24576
D=A 
@keyboard
M=D

(CHECK_KEYBOARD)
@24575
D=A
@current
M=D
@keyboard
A=M
D=M
@fillvalue
M=-1
@FILL
D;JNE
@fillvalue
M=0

(FILL)
@fillvalue
D=M
@current
A=M
M=D
@current
D=M
@16384
D=D-A
@CHECK_KEYBOARD
D;JLE
@current
M=M-1
@FILL
0;JMP