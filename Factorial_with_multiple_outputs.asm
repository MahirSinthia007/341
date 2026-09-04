.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
result dw ?
num dw ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov ah,1
int 21h
sub al,30h

mov ah,0
mov num,ax

mov cx,1
main_loop:
 cmp cx,num
 JGE exit
 mul cx
 inc cx
 jmp main_loop
 
exit:
mov result,ax
mov si,0
mov cx,0 
mov ax,result 
mov bx,10
 
 push_loop:
 cmp ax,0
 JLE pop_loop
 mov dx,0
 div bx
 push dx
 inc cx
 jmp push_loop
 
 pop_loop:
  pop dx
  add dl,30h
  mov ah,2
  int 21h
  loop pop_loop



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
