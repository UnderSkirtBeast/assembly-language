DATA	SEGMENT
	ZHOUQI1	DW 0001H
	ZHOUQI2	DW	01FFH
	JIESHU	DB	5
	BOXING	DB	4
DATA	ENDS
CODE	SEGMENT
	ASSUME	CS:CODE,DS:DATA
START:	MOV	AX,DATA
		MOV	DS,AX
		CMP	BOXING,1
		JZ	JUCHI
		CMP	BOXING,2
		JZ	JUXING
		CMP	BOXING,3
		JZ	SANJIAO
		CMP	BOXING,4
		JZ	JIETI
		HLT
		
JUCHI:
		MOV	DX,0600H
		MOV	AL,00H
		OUT	DX,AL
BB1:	INC	AL
		OUT	DX,AL
		CALL	DELAY2
		JMP	BB1
	
		
JUXING:	MOV	DX,0600H
		MOV	AL,00H
		OUT	DX,AL
		MOV	CX,ZHOUQI1		
AA1:	CALL	DELAY1
		LOOP	AA1
		MOV	AL,0FFH
		OUT	DX,AL
		MOV	CX,ZHOUQI1
AA2:	CALL 	DELAY1
		LOOP	AA2
		JMP	JUXING
		
SANJIAO:	MOV	DX,0600H
			MOV	AL,00H
CC1:		OUT	DX,AL
			CALL	DELAY2
			INC	AL
			JNZ	CC1
			DEC	AL
			DEC	AL
CC2:		OUT	DX,AL
			CALL	DELAY2
			DEC	AL
			JNZ	CC2
			JMP	CC1
			
JIETI:	MOV	DX,0600H
		MOV	BL,JIESHU
		MOV	AX,00FFH
		DIV	BL
		MOV	CX,00H
		MOV	BL,AL
DD1:	MOV	CL,JIESHU
		MOV	AL,00H
		OUT	DX,AL
		CALL	DELAY1
DD2:	ADD	AL,BL
		OUT	DX,AL
		CALL	DELAY1
		LOOP	DD2
		JMP	DD1

DELAY1	PROC	NEAR
PUSH CX
    MOV CX, 0FFFFH
D2: 
    LOOP D2
    POP CX
	RET
DELAY1	ENDP

DELAY2	PROC	NEAR
    PUSH CX
    MOV CX, ZHOUQI2
D1: 
    LOOP D1
    POP CX
	RET
DELAY2	ENDP
CODE	ENDS
END	START