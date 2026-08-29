.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
text_input dw "Enter the number of support tickets to log: $"
t1 dw "Enter the support ticket number: $"
t2 dw "Enter the number of tickets to review: $"
t3 dw "Reviewing ticket number: $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here  

mov ah,9
lea dx, text_input
int 21h


mov ah,1
int 21h
sub al,30h
mov cl,al
mov ch,0
Main_push_loop:
   mov ah,2
   mov dl,10
   int 21h
   mov ah,2
   mov dl,13
   int 21h
   mov ah,9
   lea dx,t1
   int 21h 
   mov ah,1
   int 21h
   mov dl,al
   mov dh,0
   push dx
   loop Main_push_loop
Main_pop_loop_prep:
   mov ah,2
   mov dl,10
   int 21h
   mov ah,2
   mov dl,13
   int 21h
   mov ah,9
   lea dx,t2
   int 21h 
   mov ah,1
   int 21h
   sub al,30h
   mov ah,0
   mov cx,ax
   jmp pop_loop
pop_loop:
   mov ah,2
   mov dl,10
   int 21h
   mov ah,2
   mov dl,13
   int 21h
   mov ah,9
   lea dx,t3
   int 21h
   pop ax
   mov dl,al
   mov ah,2
   int 21h
   loop pop_loop
exit:
  
   
   


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP 
    END MAIN
