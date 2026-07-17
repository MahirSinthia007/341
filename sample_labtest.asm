.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

num1 db 25
num2 dw 300
result1 dw ?
remainder db ?
quotient db ?
multiply_temp db ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here


mov al,num1
mov bl,5
mul bl
mov result1,ax
mov ax,num2
mov bl,num1
div bl
mov quotient,al
mov remainder,ah 


mov dl,remainder
add dl,48
mov ah,2
int 21h
mov ah,2
mov dl,10
int 21h
mov ah,2
mov dl,13
int 21h

mov al,quotient
mov bl,10
mov ah,0
div bl
mov ah,2
mov dl,al
mov cl,ah
add dl,48
int 21h
mov dl,cl
add dl,48
int 21h

mov ah,2
mov dl,10
int 21h
mov ah,2
mov dl,13
int 21h

print_output:






mov ax,result1
mov bl,10
mov dx,0
div bl
mov dl,ah
add dl,48
mov multiply_temp,al
mov ah,2
int 21h
mov ah,2
mov dl,10
int 21h
mov ah,2
mov dl,13
int 21h

print_loop:
 mov al,multiply_temp
 mov ah,0
 mov bl,10
 cmp al,0
 JLE exit
 div bl
 mov dl,ah
 mov multiply_temp,al
 mov dl,ah
 add dl,48
 mov ah,2
 int 21h
 mov ah,2
 mov dl,10
 int 21h
 mov ah,2
 mov dl, 13
 int 21h
 JMP print_loop








exit:
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
