.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 

TEXT DB "PROCEDURE$"
LEN EQU 9
result db 9 dup(?)


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov si,0
mov di,0
main_loop:
 cmp si,9
 JGE pop_loop
 mov al,TEXT[si]
 mov ah,0
 push ax
 inc si
 jmp main_loop
 
pop_loop:
  cmp di,9
  JGE exit
  pop ax
  mov result[di],al
  inc di
  jmp pop_loop
  
exit:



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
