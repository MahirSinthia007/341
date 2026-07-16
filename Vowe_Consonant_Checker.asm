.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

data1 db "Vowel $"
data2 db "Consonant $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov ah,1
int 21h

cmp al,65
JE vowel

cmp al,69
JE vowel

cmp al, 73
JE vowel

cmp al, 79
JE vowel

cmp al, 85
JE vowel

lea dx,data2
mov ah,9
int 21h
jmp exit


vowel:
lea dx,data1
mov ah,9
int 21h
jmp exit




exit:

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
