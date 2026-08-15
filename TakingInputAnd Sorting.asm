.MODEL SMALL
 
.STACK 100H

.DATA

; declare variabls here  
list db 5 dup(?)
smallest db 0

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov bl,0
mov ah,1
mov si,0
input:
 cmp si,5
 JGE calculation_outer
 int 21h
 mov list[si],al
 inc si
 jmp input


calculation_outer:
  cmp bl,5
  JGE exit
  mov smallest,bl
  mov cl,bl
  inc cl
  calculation_inner:
    cmp cl,5
    JGE outer_inc
    mov ch,0
    mov si,cx
    mov al,list[si]
    mov dl,smallest
    mov dh,0
    mov di,dx
    mov ah,list[di]
    cmp al,ah
    JL smallest_change
    inc cl
    JMP calculation_inner
   smallest_change:
    mov smallest,cl
    inc cl 
    jmp calculation_inner
  outer_inc:
    mov bh,0
    mov si,bx
    mov ch,0
    mov cl,smallest
    mov di,cx
    mov al,list[si]
    mov ah,list[di]
    mov list[si],ah
    mov list[di],al
    inc bl
    jmp calculation_outer

exit:  


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
