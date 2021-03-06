A8254 EQU 0600H
B8254 EQU 0602H 
C8254 EQU 0604H 
CON8254 EQU 0606H
SSTACK SEGMENT STACK 
    DW 32 DUP(?) 
SSTACK ENDS 
CODE SEGMENT 
    ASSUME CS:CODE
START: 
    MOV DX, CON8254
    MOV AL, 36H
    OUT DX, AL
    MOV DX, A8254
    MOV AL, 0FFH
    OUT DX, AL
    MOV AL, 0FFH
    OUT DX, AL
    ;8254计数器在方式2下的负脉冲宽度仅为一个周期，所以加大OUT0产生的计数脉冲（CLK1）的周期。
    MOV DX, CON8254
    MOV AL, 74H             ;8254计数器0工作在方式3，产生方波。 
    OUT DX, AL 
    MOV DX, B8254 
    MOV AL, 11H
    OUT DX, AL 
    MOV AL, 00H             ;写入计数初值11H，因为计数脉冲周期变长，次数适当减少计数器1的计数初值。
    OUT DX, AL 
AA1: 
    JMP AA1 
;将GATE1置为高电平，运行程序，在示波器中可以看到OUT1输出一段高电平后会输出一个宽度为一个周期的负脉冲。
CODE ENDS 
    END START