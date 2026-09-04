.MODEL SMALL
SHORTFALL_CALC MACRO
    local shortfall_update, big_update, exit_m
    push ax
    push bx
    push cx
    push dx
    
    mov ax,current_stock[si]
    mov bx,reorder_point[si]
    
    cmp ax,bx
    JL shortfall_update
    jmp exit_m
    shortfall_update:
     add count_shortfall,1
     mov dx,biggest_shortfall
     sub bx,ax
     cmp bx,dx
     JG big_update
     jmp exit_m 
     big_update:
      mov biggest_shortfall,bx
      mov big_idx,si
      jmp exit_m
     exit_m:
endm

 
.STACK 100H

.DATA

; declare variables here
current_stock  dw 120, 45, 300, 10, 88, 200, 5, 150
reorder_point  dw 100, 80, 250, 50, 90, 150, 60, 100
biggest_shortfall dw 0
count_shortfall dw 0
big_idx dw 0
.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov si,0
main_loop:
 cmp si,16
 JGE exit
 SHORTFALL_CALC
 add si,2
 jmp main_loop
 
exit:
 mov ax,big_idx
 mov bx,2
 mov dx,0
 div bx
 add ax,1
 mov big_idx,ax

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
