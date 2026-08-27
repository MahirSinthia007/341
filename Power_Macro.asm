.MODEL SMALL

POWER Macro base,exp,result
    push ax
    push bx
    push cx
    
    mov result,1
    mov ax,base
    mov bx,base
    mov cx,exp
    Main_loop:
     cmp cx,1
     JE exit_m
     mul bx
     dec cx
     jmp Main_loop
    exit_m:
     mov result,ax
     pop cx
     pop bx
     pop ax
     
endm


    




 
.STACK 100H

.DATA

 BASE_VAL DW 3
 EXP_VAL DW 5
 RESULT DW ?

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 

POWER BASE_VAL, EXP_VAL, RESULT



exit:
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
