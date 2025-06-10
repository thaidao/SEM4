.model small
.code
org 100h          ; COM file start address (if using DOSBox or emulator)

start:
    ; ------------ Multiplication ------------
    mov ax, 1245h       ; First number
    mov bx, 0125h       ; Second number
    mul bx              ; AX * BX = DX:AX (unsigned)
    
    ; Store result at 0x0460 (DX:AX ? 32-bit)
    mov si, 0460h
    mov [si], ax        ; Store low word at 0x0460
    mov [si+2], dx      ; Store high word at 0x0462

    ; ------------ Division ------------
    ; Dividend = 0x56781234 ? DX:AX
    mov dx, 5678h       ; High word
    mov ax, 1234h       ; Low word
    mov cx, 568Ah       ; Divisor

    div cx              ; DX:AX ÷ CX ? AX = quotient, DX = remainder

    ; Store quotient at 0x0464, remainder at 0x0466
    mov si, 0464h
    mov [si], ax        ; Store quotient
    mov [si+2], dx      ; Store remainder

    ; ------------ Exit Program ------------
    mov ah, 4Ch
    int 21h
end start
