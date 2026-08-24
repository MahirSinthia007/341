.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
text db "Mahir"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov cx,0
mov si,0
push_loop:
 cmp si,5
 JE pop_loop
 mov al,text[si]
 mov ah,0
 push ax
 inc si
 inc cx
 jmp push_loop
 
pop_loop:
 Pop bx
 mov dl,bl
 mov ah,2
 int 21h
 loop pop_loop
 


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
