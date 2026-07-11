.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
year dw 1991
data1 dw "Leap year$"
data2 dw "Not Leap Year$"
i dw ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov i,0
Main_Loop:
   MOv dx,0
   MOV ax,year
   Mov bx,4
   DIV bx
   cmp dx,0
   JE print_leap_year
   JMP Further_check
   
   
Further_check:
   MOV dx,0
   MOV ax,year
   MOV bx,400
   Div bx
   cmp dx,0
   JE last_check
   JMP print_not
last_check:
   MOV dx,0
   MOv ax,year
   mov bx,100
   div bx
   cmp dx,0
   JNE print_leap_year
   JMP print_not


   
print_leap_year:
  mov ah,9
  lea dx,data1
  int 21h
  JMP Exit 
print_not:
  mov ah,9
  lea dx, data2
  int 21h
  
Exit:
  





 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
