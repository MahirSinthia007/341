.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
x db 4

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here


call prime_numbers

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    prime_numbers PROC
        mov dl,x
        mov bl,2
       outer_loop:
          cmp bl,x
          JE exit
          mov cl,2
        main_loop:
         cmp bl,cl
         JE main_loop_done
         mov al,bl
         mov ah,0
         div cl
         cmp ah,0
         JE not_prime
         inc cl
         jmp main_loop
        not_prime:
         inc bl
         jmp outer_loop 
        
        main_loop_done:
         mov dl,bl
         add dl,30h
         mov ah,2
         int 21h
         inc bl
         jmp outer_loop
        exit:
        ret
        endp 



    END MAIN
