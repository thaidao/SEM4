; Write an assembler program which do the following:
; The program stores  two data (0x1578 and 0xAABB) in locations starting from 0x0460. The first data will be multiplied by 0x10, and the second data will be divided by 0x0F. The results (multiplication result and quotient of the division operation) of both operations will be added together and stored in memory locations starting from address 0x0464.  The program will determine how many 1’s present in the stored result. And the determined number (count value of 1’s) will be stored at location 0x046A.
; Your program must use all the necessary arithmetic instructions including logical and loop instructions.
; Author: thaidao
; Created date: 4:06 PM 2025-06-10

ORG 400H

;store first data in location starting from 0x460
MOV AX, 0X1578
MOV [0X460],AX

;first data, multiplid by 0x01
MOV CX,0x10				;multiple ax with 16
MUL CX					; multiple ax with cx
MOV [0X464],AX			; lower word
MOV [0X466],DX			; higher word

;second data, divided by 0x0f
;store second data
MOV AX, 0XAABB
MOV [0X462],AX

;MOV AX, [0X462]
MOV CX,0X0F				;divided by 0x0f
DIV CX


ADD AX,[0X464]          ;calcuate the final result

;dummy data for the algorithm
;MOV AX,0XFFFF
;MOV DX,0X00FF

;count number of 1 in AX
MOV CX,0x10 				; initialize loop counter = 16
MOV BX,0x00

;prepare for the loop
MOV SI,0X00 ; 0: check bit 1 in AX-lower word, 1: check bit 1 in DX higher word

;shift right and check bit 1 in lower word
check_bit:
TEST AX,0x01			;kiem tra lenh nay sau logic commands co bi ghi de ko

;if the result is 1, increase counter 1
JZ next_loop
INC BX				;increase 1's counter

next_loop:
;shift right
SHR AX,1
DEC CX				;decrease loop counter
JNZ check_bit

;condition to exit
CMP SI,0x01
JE	save_final_result

;check bit 1 in higher word
INC SI
MOV AX, DX			;copy higher word
MOV CX,0X10			;initialize CX=16
JMP check_bit		;jump without condition

save_final_result:
MOV [0X46A],BX		;copy the final number to 0x46A

RET