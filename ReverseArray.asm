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
 JE print
 mov ah,1
 int 21h
 sub al,30h
 mov ah,0
 mov list[si],ax
 add si,02h
 loop input_loop

print:
 mov si,12h
 inner_loop:
  mov dx,list[si]
  mov ah,2
  add dl,30h
  int 21h
  sub si,02h
  cmp si,0
  JE exit
  JMP inner_loop

exit:
    


;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP





    END MAIN




