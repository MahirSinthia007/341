.MODEL SMALL
Find_Value Macro array, len, target
    Push ax
    push bx
    push cx
    push dx
    
    mov cl,target
    mov si,0
    search_loop:
     cmp si,len
     JE not_found
     mov al,array[si]
     cmp al,cl
     JE found
     inc si
     jmp search_loop
     
     found:
     mov ah,9
     lea dx,t1
     int 21h
     jmp exit_m
     
     not_found:
     mov ah,9
     lea dx,t2
     int 21h
     jmp exit_m
     
     
     exit_m:
     pop dx
     pop cx
     pop bx
     pop ax
     
endm








 
.STACK 100H

.DATA

; declare variables here 
ARR DB 4, 8, 15, 16, 23, 42
LEN EQU 6
t1 db "Value Found$"
t2 db "Value Not Found$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

Find_Value ARR,LEN ,8


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
