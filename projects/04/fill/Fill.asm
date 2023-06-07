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

// screen = screen start
// screen_cur = current word of screen ram
// screen_end = last word of screen ram
// white = 0
// black = -1
//
// if (keyboard != white) {
//      draw(black)   
// } else {
//      draw(white)   
// }
// 
// draw (color) {
//  while (screen_cur <= screen_end){
//      @screen_cur = color;
//  }   
// }



(INIT)
	@SCREEN
	D=A
	@screen_cur
	M=D

	@8192 // screen_width/16 * screen_height
	D=D+A
	@screen_end // screen_start + screen_total (in bytes)
	M=D

	@KBD
	D=M
	@CLEAR
	D; JEQ // if keyboard input == 0, clear screen

	@draw_color
	M=-1 // else, set draw_color to black

	@DRAW_SCREEN
	0; JMP

(CLEAR)
	@draw_color
	M=0 //set draw_color to white

(DRAW_SCREEN)
	@screen_cur
	D=M
	@screen_end
	D=D-M
	@INIT
	D; JEQ // go back to init if finished drawing

	@draw_color
	D=M
	@screen_cur
	A=M
	M=D // draw color to byte at cur

	@screen_cur
	M=M+1 //increment cur

	@DRAW_SCREEN
	0; JMP //loop