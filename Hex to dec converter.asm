.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

data3 db "Enter a hex digit: $"
data1 db "In Decimal it is $"
data2 db "Do you want to do it again? $"
temp db ?




.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
Start:

lea dx,data3
mov ah,9
int 21h


mov ah,1
int 21h
mov temp,al

mov ah,2
mov dl,10
int 21h

mov ah,2
mov dl,13
int 21h  


mov bl,39h
CMP temp,bl
JLE hextodec_normal 

mov bl, 41h
CMP temp,bl
JGE hextodex_AF

mov bl,30h
CMP temp,bl
JGE hextodec_normal


 

hextodec_normal:  
   lea dx,data1
   mov ah,9
   int 21h
   mov dl,temp
   mov ah,2
   int 21h
   JMP Exit_code_check
hextodex_AF:
   lea dx, data1
   mov ah,9
   int 21h
   mov ah,2
   mov dl,31h
   int 21h
   sub temp,11h
   mov dl,temp
   mov ah,2
   int 21h
   JMP Exit_code_check
Exit_code_check:
   lea dx,data2
   mov ah,9 
   int 21h
   
   mov ah,1
   mov bl,59h
   int 21h
   mov temp,al
   
   CMP temp,bl
   JE Start
   JMP Exit_code

;exit to DOS

Exit_code:

               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
   
   
