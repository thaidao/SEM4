ORG 0X400
; Load values into registers
MOV AX, 5678H     ; First number
MOV BX, 0AA87H    ; Second number

; ADDITION
ADD AX, BX        ; AX = 5678H + AA87H
ADD AX, 0003H     ; Increase result by 3

; Store result at memory[0460] using register indirect
MOV SI, 0460H
MOV [SI], AX      ; Store addition result at 0460H

; SUBTRACTION
MOV AX, 5678H     ; Reload first number
SUB AX, BX        ; AX = 5678H - AA87H
SUB AX, 0002H     ; Decrease result by 2

; Store result at memory[0462] using register indirect
MOV SI, 0462H
MOV [SI], AX      ; Store subtraction result at 0462H

INT3
