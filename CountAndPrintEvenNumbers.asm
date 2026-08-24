.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
list1 db 1,2,3,4,5
count db 0

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov si,0
mov cl,2
main_loop:
 cmp si,5
 JE exit
 mov al,list1[si]
 mov ah,0
 div cl
 cmp ah,0
 JE even_done
 jmp not_even
 even_done:
  add count,1
  mov ah,2
  mov dl,list1[si]
  add dl,030h
  int 21h
  inc si 
  jmp main_loop
 not_even:
  inc si
  jmp main_loop





exit:

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
