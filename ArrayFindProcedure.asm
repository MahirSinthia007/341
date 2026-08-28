.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

len dw 5
arr db 1,2,3,4,5
target db 3

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

call Existence_checker


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
   Existence_checker Proc
    mov al,target
    mov si,0
    Main_check_loop:
     cmp si,len
     JE not_found
     mov dl,arr[si]
     cmp al,dl
     JE found
     inc si
     jmp Main_check_loop
     
     found:
      mov ah,2
      mov dl,31h
      int 21h
      jmp exit_p
     not_found:
      mov ah,2
      mov dl,30h
      int 21h
      jmp exit_p
     exit_p:
      ret
   endp
   
     
    
    
    
    
    
    
    
    
    
    END MAIN
