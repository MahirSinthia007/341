.MODEL SMALL
 
.STACK 100H

.DATA

; declare variabls here  
list db 15 dup(0)

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov bl,0
mov ah,1
int 21h
sub al,30h

mov cl,al
mov dl,0
input:
 cmp dl,cl
 JGE output
 mov ah,1
 int 21h
 mov dh,0
 mov si,dx
 mov list[si],al
 inc dl
 jmp input
 
                        
                        
 
output:
cmp bl,cl
JGE exit
mov ah,2
mov bh,0
mov di,bx
mov dl,list[di]
int 21h
inc bl
jmp output

exit:  


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
