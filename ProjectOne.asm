;Name: Jacob Eckroth
;Date: October 5, 2020
;Program Number One
;Program Description: This program asks for two numbers as input from the user, and then
; displays some simple arithmetic with them via adding them, subtracting, multiplying, and
; dividing. This program does not account for negative inputs and does not confirm that the
; second number is lower than the second, therefore integer overflows can occur if the user
; inputs a second number bigger than the first during the subtraction.
TITLE Elementary Arithmetic

INCLUDE Irvine32.inc



.data				;variable initializations here.
Greeting BYTE "Elementary Arithmetic by Jacob Eckroth", 13, 10, 13, 10,  0	;13 10 here are carriage return and linefeed to make sure we get onto new lines.

Prompt BYTE "Enter 2 numbers, and I'll show you the sum, difference,product, quotient, and remainder.", 13,10,13,10,0
inputPrompt1 BYTE "First number:",0
inputPrompt2 BYTE "Second number:",0

plus BYTE " + ",0			; all the mathematical symbols.
multiply BYTE " * ",0
subtract BYTE " - ",0
divide BYTE " / ",0
equals BYTE " = ",0
remainder BYTE ' remainder ',0



firstInt DWORD ?			;the integers the user will input, uninitialized
secondInt DWORD ?


;result variables for storage.
subtractResult DWORD ?
addResult DWORD ?		
multiplyResult DWORD ?
divideResult DWORD ?
remainderResult DWORD ?	



goodbyePrompt \
BYTE "Impressed? Bye!",0

.code
main PROC

;Displays the program title as well as the information about what the program will do, and my name.
	mov		edx, offset Greeting		
	call	Writestring				
	mov		edx, offset Prompt			
	call	Writestring


;Gets input from the user into inputPrompt1 and inputPrompt2
	mov		edx, offset inputPrompt1				
	call	Writestring											;Prints the prompt for number 1
	call	ReadDec						
	mov		firstInt, eax					
	mov		edx, offset inputPrompt2				
	call	Writestring											;Prints the prompt for number 2
	call	ReadDec						
	mov		secondInt, eax					



;Addition

;Prints Addition Syntax
	call	Crlf
	mov		eax, firstInt					
	call	WriteDec						
	mov		edx, offset plus				
	call	Writestring
	mov		eax, secondInt					
	call	WriteDec
	mov		edx, offset equals				
	call	Writestring
	

;Calculates Addition Result
	add		eax, firstInt					
	mov		addResult, eax
	call	WriteDec						





;Subtraction
	
;Prints the Subtraction Syntax
	Call	crlf
	mov		eax, firstInt					
	call	WriteDec						
	mov		edx, offset subtract				
	call	Writestring
	mov		eax, secondInt					
	call	WriteDec
	mov		edx, offset equals				
	call	Writestring

;Calculates the Subtraction result of firstInt - secondInt and prints it
	mov		eax, firstInt					
	sub		eax, secondInt					
	mov		subtractResult, eax			
	call	writeDec	
	




;Multiplication
	
;Prints the Multiplication Syntax
	call	Crlf
	mov		eax, firstInt					
	call	WriteDec						
	mov		edx, offset multiply		
	call	Writestring
	mov		eax, secondInt					
	call	WriteDec
	mov		edx, offset equals				
	call	Writestring


;Calculates the multiplication result and prints it
	mov		ebx, firstInt
	mul		ebx
	mov		multiplyResult, eax		
	call	WriteDec



;Division

;Prints the Division Syntax
	call	Crlf
	mov		eax, firstInt					
	call	WriteDec						
	mov		edx, offset divide				
	call	Writestring
	mov		eax, secondInt					
	call	WriteDec
	mov		edx, offset equals				
	call	Writestring

;Calculates division result and prints it as well as the remainder
	mov		eax,firstInt					
	cdq					
	div		secondInt
	mov		divideResult, eax
	call	WriteDec
	mov		remainderResult,edx				
	mov		edx, offset remainder			
	call	Writestring
	mov		eax, remainderResult						
	call	WriteDec	


;Prints final goodbye Message
	call	Crlf
	mov		edx, offset goodbyePrompt			
	call	Writestring

	


   	exit
main ENDP
END main