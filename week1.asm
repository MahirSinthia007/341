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

;Task 8-4 to catch dividend error
MOV AX,0C2A2h
MOV BX,0ABCDh
MUL BX

MOV CX,0BEDh
DIV CX


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
