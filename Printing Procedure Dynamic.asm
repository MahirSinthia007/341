.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
num dw 123

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here


call Printing_Numbers

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP 
   Printing_Numbers Proc
    mov ax,num
    mov bx,10
    mov cx,0
    Main_push_loop:
     cmp ax,0
     JE main_pop_loop
     mov dx,0
     div bx
     push dx
     inc cx
     jmp Main_push_loop
    Main_pop_loop:
      pop ax
      mov dl,al
      add dl,30h
      mov ah,2
      int 21h
      loop Main_pop_loop
     exit_m:
     ret
   endp
   



    END MAIN
