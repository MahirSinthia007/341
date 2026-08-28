.MODEL SMALL

Print_Primes Macro limit
    push ax
    push bx
    push cx
    push dx
    
    mov bx,2
    outer_loop:
     cmp bx,limit
     JGE all_done
     mov cx,2
     inner_loop:
      cmp cx,bx
      JE Is_prime
      mov ax,bx
      mov dx,0
      div cx
      cmp dx,0
      JE Is_not_prime
      inc cx
      jmp inner_loop
     Is_prime:
      mov ax,bx
      mov cx,10
      mov dx,0
      div cx
      mov cl,dl
      mov dl,al
      add dl,30h
      mov ah,2
      int 21h
      mov dl,cl
      add dl,30h
      mov ah,2
      int 21h
      mov dl," "
      mov ah,2
      int 21h
      inc bx
      jmp outer_loop
     Is_not_prime:
      inc bx
      jmp outer_loop
     all_done:
      
endm

    
 
.STACK 100H

.DATA

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
Print_Primes 20



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
