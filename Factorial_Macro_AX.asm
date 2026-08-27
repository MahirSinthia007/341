.MODEL SMALL

Factorial Macro num,result
    local Fact_loop, exit_mac
    push ax
    push bx
    push cx
    
    mov ax,1
    mov bx,num
    Fact_loop:
     cmp bx,1
     JE exit_mac
     MUL bx
     dec bx
     jmp Fact_loop
    exit_mac:
     mov result,ax
    pop cx
    pop bx
    pop ax
    
endM


     







 
.STACK 100H

.DATA

; declare variables here
num dw 5
result dw 0



.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 

Factorial 6,result




 

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
