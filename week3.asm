 .MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

str dw "Equal $"


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV BL,05h
MOV AH,1
int 21h
sub al,30h

cmp bl,al
JE  PRINT
JNE END_BLOCK




PRINT:
    mov ah,9
    lea dx,str
    int 21h 
    
END_BLOCK:
    




 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
