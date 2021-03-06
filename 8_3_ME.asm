A8255_CON EQU 0606H
A8255_A EQU 0600H
A8255_B EQU 0602H
A8255_C EQU 0604H
DATA	SEGMENT
	TABLE	DB	3FH
			DB	06H
			DB	5BH
			DB	4FH
			DB	66H
			DB	6DH
			DB	7DH
			DB	07H
			DB	7FH
			DB	6FH
DATA	ENDS
CODE	SEGMENT
	ASSUME	DS:DATA,CS:CODE
START:	MOV	AX,DATA
		MOV	DS,AX
		MOV	AX,0
		MOV	ES,AX
		MOV	AX,OFFSET MIR6
		MOV	DI,0038H
		MOV	[ES:DI],AX
		MOV	AX,SEG	MIR6
		MOV	DI,003AH
		MOV	[ES:DI],AX
		
		CLI
		MOV AL, 11H
    	OUT 20H, AL
    	MOV AL, 08H
   	 	OUT 21H, AL
    	MOV AL, 04H
    	OUT 21H, AL
    	MOV AL, 01H
    	OUT 21H, AL
    	MOV AL, 3FH
    	OUT 21H, AL
		STI
		
		
		
		
		LEA	SI,TABLE
		MOV	BH,11000000B
		MOV	DX,A8255_CON
		MOV	AL,89H
		OUT	DX,AL
		
AA1:	MOV	AL,3FH
		MOV	DX,A8255_B
		OUT	DX,AL
		MOV	DX,A8255_A
		MOV	AL,BH
		OUT	DX,AL
		CALL	DELAY
		JMP	AA1
		
AA2:	MOV	AL,3FH
		MOV	DX,A8255_B
		OUT	DX,AL
		MOV	DX,A8255_A
		MOV	AL,0FFH
		OUT	DX,AL
		
AA3:	JMP	AA3
		HLT

MIR6:
		PUSH AX
		SAR	BH,1
		CMP	BH,0FFH
		JZ	AA2
    	MOV AL,26H
    	OUT 20H,AL
    	POP AX
		IRET

DELAY	PROC	NEAR
		PUSH	CX
		MOV	CX,0FFFFH
XX1:	LOOP	XX1
		MOV	CX,0FFFFH
XX2:	LOOP	XX2		
		POP	CX
		RET
DELAY	ENDP



CODE	ENDS
END	START
		
					