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


.MODEL SMALL
.STACK 100H
.DATA
; declare variables here
n1 dw 0
n2 dw 0
product dw 0 


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
JE input_loop2
sub al,48
mov cl,al
mov ax,n1
mov bx,10
mul bx
mov ch,0
add ax,cx
mov n1,ax
JMP input_loop


input_loop2:

mov ah,1
int 21h
cmp al,13
JE main_loop
sub al,48
mov cl,al
mov ax,n2
mov bx,10
mul bx
mov ch,0
add ax,cx
mov n2,ax
JMP input_loop2


Main_loop:
   mov ax,0
   mov bx,n2
   decrement_loop:
   mov ax,product
   cmp bx,0
   JE exit
   mov cx,n1
   add ax,cx
   dec bx
   mov product,ax
   JMP decrement_loop
   
   






exit:


;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN
