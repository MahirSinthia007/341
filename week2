 .MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 

ask db 'Enter a digit: $'
result db "My favourite digit is: $"


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 
LEA DX, ask
MOV AH,9
int 21h

MOV AH,1
INT 21h
MOV BL,AL

MOV AH,2
MOV DL, 10
INT 21h 
MOV AH,2
MOV DL,13
INT 21h

LEA DX,result
MOV ah,9
int 21h
mov dl,bl
mov ah,2
int 21h






 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
