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






 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP

Print_Num PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
 MOV BX,10
 MOV CX,0
 inner_loop:
  mov dx,0
  DIV BX
  PUSH Dx
  inc cx
  cmp ax,0
  jne inner_loop
  je print_loop
  
 print_loop:
  POP DX
  add dl,30h
  mov ah,2
  int 21h
  loop print_loop
  
  
  Pop dx
  pop cx
  pop bx
  pop ax
  
  
  
  
  ret
  
endp

    END MAIN
