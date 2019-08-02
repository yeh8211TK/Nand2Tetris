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

   (START)
   @KBD
   D=M

   @WHITE        // goto white screen
   D;JEQ
   
   @SCREEN       // black screen
   D=A
   
   @addr
   M=D
   
   @i
   M=0

   @8191
   D=A

   @n
   M=D

   (PIXELBLACK)  // start iteration
   @i
   D=M

   @n
   D=D-M

   @START
   D;JGT         // check if i > n, yes => goto START
   
   @i
   D=M

   @addr
   A=M+D
   M=-1
   
   @i
   M=M+1
   
   @PIXELBLACK
   0;JMP

   (WHITE)       // white screen 
   @SCREEN
   D=A
   
   @addr
   M=D
   
   @i
   M=0

   @8191
   D=A

   @n
   M=D

   (PIXELWHITE)  // start iteration
   @i
   D=M

   @n
   D=D-M

   @START
   D;JGT         // check if i > n, yes => goto START
   
   @i            
   D=M

   @addr
   A=M+D
   M=0
   
   @i
   M=M+1

   @PIXELWHITE
   0;JMP