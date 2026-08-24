.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
list db 10 dup(?)
sum db 0


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
 int 21h
 sub al,30h
 mov list[si],al
 inc si
 loop input_loop

mov cx,10
mov si,0
sum_loop:
 cmp cx,0
 JE print
 mov al,list[si]
 add sum,al
 inc si
 dec cx
 jmp sum_loop
 


print:
 mov ah,0
 mov al,sum
 mov bl,10
 div bl
 mov dl,al
 add dl,30h
 mov cl,ah
 mov ah,2
 int 21h
 mov dl,cl
 add dl,30h
 mov ah,2
 int 21h
 

exit:

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
