// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

   @R0
   D=M

   @ZERO   
   D;JEQ   // n = 0 goto ZERO

   @n      // a variable n with address RAM[16]
   M=D     // n = R0

   @R1
   D=M

   @ZERO      
   D;JEQ   // R1 = 0 goto ZERO

   @R2
   M=0

   @i      // a variable i with address RAM[17]
   M=1

   (LOOP)
   @i      // a variable i with address RAM[17]
   D=M

   @n
   D=D-M   // D = i - n = RAM[17] - RAM[16]

   @END       
   D;JGT   // i - n > 0 goto END

   @R1
   D=M

   @R2
   M=M+D   // RAM[2] = RAM[2] + RAM[1]

   @i
   M=M+1   // i = i + 1

   @LOOP   
   0;JMP   // goto LOOP

   (ZERO)
   @R2
   M=0

   (END)
   @END    
   0;JMP   // goto END



