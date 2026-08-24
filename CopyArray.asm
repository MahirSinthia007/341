.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
list1 db 1,2,3,4,5
list2 db 5 dup(0)

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov cx,5
mov si,0
mov di,0
copy_loop:
 mov al,list1[si]
 mov list2[si],al
 inc si
 cmp si,5
 JE exit
 JMP copy_loop


exit:

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
