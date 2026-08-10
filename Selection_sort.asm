.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

a db 3,2,4,6,1
smallest db 0 
inner_loop db 5
loop_count db 4
outer_idx db 0

.CODE
MAIN PROC

; initialize DS 




MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov dl,smallest
mov bl,outer_idx
outer:
 mov dl,smallest
 mov dh,4
 cmp bl,dh
 JG exit
 mov cl,bl
 inc cl
 inner:
   cmp cl,4
   JG inner_exit
   mov ch,0
   mov si,cx
   mov al,a[si]
   mov dl,smallest
   mov dh,0
   mov di,dx
   mov ah,a[di]
   cmp al,ah
   JL change_smallest
   JGE increment_inner
   change_smallest:
      mov ax,si
      mov smallest,al
      jmp increment_inner
   increment_inner:
      inc cl
      jmp inner
   inner_exit:
     mov dl,smallest
     mov dh,0
     mov si,dx
     mov ah, a[si]
     mov di,bx
     mov al,a[di]
     mov bh,ah
     mov ah,al
     mov al,bh
     mov a[si],ah
     mov a[di],al
     inc bl
     mov smallest,bl
     jmp outer
     
 






 




exit:

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
