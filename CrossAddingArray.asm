.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
list1 db 1,2,3,4,5
list2 db 1,2,3,4,5
list3 db 5 dup(0)

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov cx,5
mov si,0
mov di,4

copy_loop:
 mov al,list1[si] 
 mov di,04h
 mov bx,si
 mov cx,di
 sub cx,bx
 mov di,cx
 add al,list2[di]
 mov list3[si],al
 inc si
 cmp si,4
 JG exit
 jmp copy_loop


exit:

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
