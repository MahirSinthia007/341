.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
input db ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
MOV ah,1
int 21h
mov cl,al
sub cl,30h
mov ch,0
mov bl,31h
Main_Loop:
   mov dl,bl
   mov ah,2
   int 21h
   inc bl
   mov dh,bl
   sub dh,31h
   cmp cl,dh
   JG Main_Loop
   JMP Exit 
   


Exit:



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
