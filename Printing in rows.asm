.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
n db ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here  
MOV ah,1
int 21h
mov cl,0
sub al,30h
mov n,al
mov bl,0
Main_Loop:
  CMP cl,n
  JGE Exit_code
  MOv bl,1
  Printing_Loop:
    mov dl,bl
    add dl,30h
    mov ah,2
    int 21h
    cmp bl,cl
    JG increment
    inc bl
    JMP Printing_Loop
  increment:
  mov ah,2
  mov dl,10
  int 21h
  mov ah,2
  mov dl,13
  int 21h
  inc cl
  JMP Main_Loop



 



Exit_code:

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
