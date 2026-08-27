.MODEL SMALL

Factorial Macro num,result
    local Fact_loop, exit_mac
    push ax
    push bx
    push cx
    
    mov ah,0
    mov al,1
    mov cl,num
    Fact_loop:
     cmp cl,1
     JE exit_mac
     MUL Cl
     dec cl
     jmp Fact_loop
    exit_mac:
     mov result,al
    pop cx
    pop bx
    pop ax
    
endM


     







 
.STACK 100H

.DATA

; declare variables here
num db 5
result db 0



.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 

Factorial 4,result




 

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
