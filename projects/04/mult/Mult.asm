// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// for (i=R1, R2=0; R1 > 0; i--) {
//  R2 += R0
// }
// END


@R1
D=M
@iterator
M=D //set iterator to R1 (amount of times we'll add R0)

@R2
M=0 // initalize to 0

(LOOP)
@iterator
D=M
@END
D; JEQ // if end of loop, end

@iterator
M=M-1 // decriment iterator

@R0
D=M //load R0 to data
@R2
M=D+M //add R0 to R2 (acc)

@LOOP
D; JMP

(END)
@END
D; JMP