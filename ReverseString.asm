.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 

arr db "Mahir$"
result db 5 dup(?)
len dw 5

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

call ReverseString


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP 
    ReverseString Proc
        mov si,0
        mov di,0
        Main_push_loop:
         cmp si,len
         JE Main_pop_loop
         mov al,arr[si]
         mov ah,0
         push ax
         inc si
         jmp Main_push_loop
        Main_pop_loop:
         cmp di,len
         JE exit_p
         pop AX
         mov result[di],al
         inc di
         jmp Main_pop_loop
        exit_p:
        ret 
        ReverseString endp

    END MAIN
