.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

a db 1,2,3,4,5

.CODE
MAIN PROC

; initialize DS 




MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov cx,5
mov ah,2
lea si,a
start:
 mov dl,[si]
 add dl,30H
 int 21h
 inc si
 loop start
  
 






end:


 

;exit to DOS
               
MOV AX,4C00H





.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

a db 1,2,3,4,5

.CODE
MAIN PROC

; initialize DS 




MOV AX,@DATA
MOV DS,AX
 
; enter your code here

 
mov cx,5
mov ah,2
mov si,0
start:
mov dl,a[si]
add dl,30H
int 21h
inc si 
loop start





end:


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN

INT 21H

MAIN ENDP
    END MAIN
