.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

list1 db 1,2,3,4,5
x db 4
len dw 5
found1 db "Found$"
nfound1 db "Not Found$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here


call check_array

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
      check_array PROC
        mov si,0
        find_loop:
        cmp si,len
        JE not_found
        
        mov al,list1[si]
        cmp al,x
        JE found
        inc si
        jmp find_loop
        
        found:
        lea dx,found1
        mov ah,9
        int 21h
        jmp exit
        
        not_found:
        lea dx,nfound1
        mov ah,9
        int 21h
        jmp exit




exit:
ret

ENDP



    END MAIN
