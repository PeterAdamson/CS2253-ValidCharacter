;Author: Peter Adamson
;This function checks whether a character loaded into R2 is in the range of 'a' to 'z' or 'A' to 'Z'
;if the character is in the range, returns 1 in R0.  Otherwise returns 0 in R0

ISALPHA
	STMDB	sp!,{LR}	;stores the link register in the stack 
	MOV	R0,#0	        ;defaults R0 to 0
	CMP	R2,#'A'	        
	BLT	DONE1	        ;if the value in R2 is less than 'A', nothing needs to be done
    	CMP 	R2,#'z'
	BGT	DONE1	        ;if the value in R2 is greater than 'z', nothing needs to be done
	CMP	R2,#'Z'
	MOVLE	R0,#1	        
	BLE	DONE1	        ;if this instruction is reached, the value in R2 is greater than 'A'.  If it is also less than 'Z', set R0 to 1
	CMP	R2,#'a'	        
	MOVGE	R0,#1	        ;if this instuction is reached, the value in R2 is less than 'z'.  If it is also greater than 'a', set R0 to 1
DONE1
	LDMIA	sp!,{PC}   	;load the link register into the program counter
	BX	R14
