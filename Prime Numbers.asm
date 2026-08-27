.MODEL SMALL 

Print_Primes Macro limit
    LOCAL outer_loop, inner_loop, Is_prime, Is_not_prime, Done_all

    push ax
    push bx
    push cx
    push dx
    
    mov bx,2
    outer_loop:
     cmp bx,limit
     JGE Done_all
     
     mov cx,2
     inner_loop:
     mov ax,bx
      cmp ax,cx
      JE Is_prime
      mov dx,0
      Div cx
      cmp dx,0
      JE Is_not_prime
      inc cx
      jmp inner_loop
     Is_prime:
      mov ax,bx
      mov cl,10
      div cl
      mov cl,ah
      add al,"0"
      mov dl,al
      mov ah,2
      int 21h
      add cl,"0"
      mov dl,cl
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
     Done_all:
      Pop dx
      pop cx
      pop bx
      pop ax
      
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
Print_Primes 30




 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
