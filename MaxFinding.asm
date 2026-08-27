.MODEL SMALL

MAX2 Macro num1,num2,result
    LOCAL ax_big, bx_big, exit_m
    mov Ax,num1
    mov BX,num2
    cmp ax,bx
    JG ax_big
    JMP bx_big
    ax_big:
     mov result,ax
     jmp exit_m
    bx_big:
     mov result,bx
     jmp exit_m
    exit_m:
endm


    




 
.STACK 100H

.DATA


 ARR DW 3, 9, 2, 7, 5, 12, 6
 N EQU 7
 MAXV DW ?

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov di,0
mov si,0
mov cx,arr[si]
mov MAXV,cx
main_loop:
   cmp di,N
   JE exit
   mov dx,arr[si]
   MAX2 dx,MAXV,MAXV
   add si,2
   inc di
   jmp main_loop




exit:
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
