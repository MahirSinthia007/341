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

mov al,2
mov bl,1
add al,bl
mov bl,3
mov cl,1
sub bl,cl
mul bl
mov bl,5
mov cl,3
add bl,cl
add bl,2
mov cx,ax
mov al,1
mov dl,2
mul dl
add bh,0
sub bx,ax
mov ax,cx
mov dx,0
div bx







;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN
