.MODEL SMALL

Reverse_String Macro string,len,result
    Local Main_push_loop, Main_pop_loop
    mov di,0
    mov si,0
    Main_push_loop:
     cmp di,len
     JE Main_pop_loop
     mov al,string[di]
     mov ah,0
     push ax
     add di,1
     jmp Main_push_loop
     
    Main_pop_loop:
     cmp si,len
     JE exit_mac
     pop ax
     mov result[si],al
     add si,1
     jmp Main_pop_loop
    exit_mac:
    
     
     

endm
     







 
.STACK 100H

.DATA

; declare variables here
string db "Mahir$"
len  dw 5
result db 5 dup(?),"$"



.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 


Reverse_String string,len,result
lea dx,result
Call Display_string


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP

   Display_string PROC
    MOV ah,9
    int 21h
    ret
    
   display_string endp
    
    
    
    
    
    
    END MAIN
