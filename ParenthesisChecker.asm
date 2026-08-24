.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
sample db "(()))$"
base1 db "balanced$"
base2 db "unbalanced$"
len dw 5
counter db 0



.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov si,0
main_loop:
  cmp si,5
  JGE balanced
  mov al,sample[si]
  cmp al,040
  JE stack_push
  JNE stack_pop
  
  
  stack_pop:
    cmp counter,0
    JE not_balanced
    Pop ax
    cmp al,40
    JNE not_balanced
    sub counter,1
    add si,1
    jmp main_loop
    
  not_balanced:
    lea dx,base2
    mov ah,9
    int 21h
    jmp exit
  
  
  stack_push:
   mov ah,0
   push ax
   add si,1
   add counter,1
   jmp main_loop
   
   
   balanced:
    cmp counter,0
    JNE not_balanced
    lea dx,base1
    mov ah,9
    int 21h
    jmp exit

exit:
 

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
