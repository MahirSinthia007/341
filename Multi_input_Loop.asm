.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here


number1 dw 0


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

input_loop:
mov ah,1
int 21h
cmp al,13
JE main_code
sub al,48
mov bl,al
mov bh,0
mov ax,number1
mov cx, 10
mul cx
add ax,bx
mov number1,ax
jmp input_loop



 






main_code:


exit:

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
