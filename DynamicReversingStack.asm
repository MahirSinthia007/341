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

mov cx,0
input_loop:
 mov ah,1
 int 21h
 cmp al,32
 JE pop_loop
 cmp al,13
 JE exit
 mov ah,0
 push ax
 inc cx
 jmp input_loop
 
pop_loop:
 pop ax
 mov dl,al
 mov ah,2
 int 21h
 dec cx
 cmp cx,0
 JE cx_initiation
 jmp pop_loop
 
cx_initiation:
 mov cx,0
 mov dl," "
 mov ah,2
 int 21h
 jmp input_loop
 
exit:
 
    


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP 
    END MAIN
