.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
n1 db ?
n2 db ?
n3 db ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov ah,1
int 21h
sub al,48
mov n1,al

mov ah,1
int 21h
sub al,48
mov n2,al

mov ah,1
int 21h
sub al,48
mov n3,al

mov al,n1
mov bl,n2
mov cl,n3

cmp al,bl
JGE greater_more_check
JMP last_two_comp

last_two_comp:
 mov bl,n2
 mov cl,n3
 cmp bl,cl
 JGE second_greatest
 mov ah,2
 mov dl,n3
 add dl,48
 int 21h
 JMP Exit

greater_more_check:
 cmp al,cl
 JGE first_greatest
 cmp bl,cl
 JGE second_greatest
 mov ah,2
 mov dl,n3
 add dl,48
 int 21h
 JMP Exit
 
second_greatest:
 mov ah,2
 mov dl,n2
 add dl,48
 int 21h
 JMP Exit


first_greatest:
 mov ah,2
 mov dl,n1
 add dl,48
 int 21h
 JMP Exit
 
 
 
Exit:






 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
