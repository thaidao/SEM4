;8086 Assembly program for addition and subtraction

ORG 400h       ; Origin for .COM program (used by 8086 Trainer kits)

MOV AX, 087A5h ; Load AX with first number (0x87A5)
ADD AX, 0003h  ; Increment AX by 0x03

MOV BX, 0978Bh ; Load BX with second number (0x978B)
SUB BX, 0002h  ; Decrement BX by 0x02

MOV CX, AX     ; Prepare for addition
ADD CX, BX     ; CX = AX + BX

MOV DX, AX     ; Prepare for subtraction
SUB DX, BX     ; DX = AX - BX

INT3            ; Interrupt
