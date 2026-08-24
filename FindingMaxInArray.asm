.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
list1 db 1,2,3,4,5
max db ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov cx,5
mov si,0
mov bl,list1[si]
mov max,bl
Max_loop:
 cmp si,5
 JE exit
 mov bl,max
 mov bh,list1[si]
 cmp bl,bh
 JL change
 inc si
 jmp Max_loop
 change:
  mov max,bh
  inc si
  jmp Max_loop


exit:

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
