.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 




.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov bx,0
mov cx,5
Input_Loop:
  cmp bx,cx
  JE Output_Loop
  mov ah,1
  int 21h
  inc bx
  JMP Input_Loop
Output_Loop:
  mov ah,2
  mov dl,13
  int 21h
  mov bx,1
Printing_Pattern:
  mov dl,58h
  mov ah,2
  int 21h
  cmp bx,cx
  JE exit
  inc bx
  JMP Printing_Pattern


exit:




;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
