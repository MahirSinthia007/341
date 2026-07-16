.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
l1 db ?
l2 db ?
l3 db ?
data1 db "N$"
data2 db "Y$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 


mov ah,1
int 21h
sub al,48
mov l1,al

mov ah,1
int 21h
sub al,48
mov l2,al

mov ah,1
int 21h
sub al,48
mov l3,al

check:

mov al,l1
mov bl,l2
add al,bl
mov cl,l3
cmp al,cl

JLE not_equal

mov al,l2
mov bl,l3
add al,bl
mov cl,l1
cmp al,cl

JLE not_equal

mov al,l1
mov bl,l3
add al,bl
mov cl,l2
cmp al,cl


JLE not_equal

lea dx,data2
mov ah,9
int 21h
JMP exit

not_equal:
lea dx, data1
mov ah,9
int 21h
JMP exit


 


exit:

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
