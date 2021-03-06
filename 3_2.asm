CODE SEGMENT
	ASSUME	CS:CODE
MAIN	PROC	FAR
START:



	;CLI
;	MOV	DX,0020H
;	MOV	AL,10H		
;	OUT	DX,AL
;	MOV	AX,00H
;	MOV	DX,0021H
;	MOV	AL,38H		
;	OUT	DX,AL
;	MOV AL,02H		
;	OUT	DX,AL
	;STI
	
	
	;CLI
;	MOV	DX,00A0H
;	MOV	AL,12H
;	OUT	DX,AL
;	MOV	DX,00A1H
;	MOV	AL,0D8H
;	OUT	DX,AL
;	MOV	AL,02H
;	OUT	DX,AL
	;STI
	CLI
	MOV	DX,0021H
	MOV	AL,3FH
	OUT	DX,AL
	STI
	
	CLI
	MOV	AX,0
	MOV	ES,AX
	MOV	DI,0038H
	MOV	AX,OFFSET	IR6
	MOV	ES:[DI],AX
	INC	DI
	INC	DI
	MOV	AX,SEG IR6
	MOV	ES:[DI],AX
	MOV	DI,003CH
	MOV	AX,OFFSET 	IR7
	MOV	ES:[DI],AX
	INC	DI
	INC	DI
	MOV	AX,SEG	IR7
	MOV	ES:[DI],AX
	STI
	
	MOV	DX,0646H
	MOV	AL,80H
	OUT	DX,AL
	MOV BL,80H
AA3:	MOV	DX,0642H
		MOV	AL,BL
		OUT	DX,AL
		JMP	AA3


MAIN	ENDP	
	
	
	
IR6 PROC	FAR
	CMP	BL,01H
	JZ	B1
	SHR	BL,1
B1:	MOV	DX,0642H
	MOV	AL,BL
	OUT	DX,AL
	MOV	AL,26H
	OUT	20H,AL
	MOV	CX,0FFFFH
BB1:	LOOP	BB1
	MOV	CX,0FFFFH
BB2:	LOOP	BB2
	MOV	CX,0FFFFH
BB3:	LOOP	BB3
	MOV	CX,0FFFFH
BB4:	LOOP	BB4
	MOV	CX,0FFFFH
BB5:	LOOP	BB5
	IRET
IR6	ENDP

IR7	PROC	FAR
	CMP	BL,80H
	JZ	C1
	SHL	BL,1

C1:	MOV	DX,0642H
	MOV	AL,BL	
	OUT	DX,AL
	MOV	AL,27H
	OUT	20H,AL
	MOV	CX,0FFFFH
CC1:	LOOP	CC1
	MOV	CX,0FFFFH
CC2:	LOOP	CC2
	MOV	CX,0FFFFH
CC3:	LOOP	CC3
	MOV	CX,0FFFFH
CC4:	LOOP	CC4
	MOV	CX,0FFFFH
CC5:	LOOP	CC5
	IRET
IR7	ENDP
CODE	ENDS
END	START