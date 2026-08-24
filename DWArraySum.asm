.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
list dw 10 dup(?)
sum dw 0


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here



mov cx,10
mov ah,1
mov si,0
input_loop:
 cmp cx,0
 JE sum_loop
 mov ah,1
 int 21h
 sub al,30h
 mov ah,0
 mov list[si],ax
 add si,02h
 loop input_loop

mov cx,10
mov si,0
sum_loop:
 cmp cx,0
 JE print
 mov ax,list[si]
 add sum,ax
 add si,02h
 dec cx
 jmp sum_loop
 


print:
 mov ax,sum
 call Print_Num
 

exit:

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
 Print_Num PROC
    mov bx,10
    mov cx,0
    divide:
    mov dx,0
    div bx
    push dx
    inc cx
    cmp ax,0
    JE print_loop
    JMP divide
      
    print_loop:
     pop dx
     add dl,30H
     mov ah,2
     int 21h
     loop print_loop
     ret
 Print_Num ENDP
    
    







    END MAIN
