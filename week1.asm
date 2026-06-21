 .MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
;Task Multiplication
MOV AX,01224h
MOV BX,6
MUL BX

;Task-8
MOV AX,0F4D5h
MOV BX,0C9A5h
DIV BX


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
