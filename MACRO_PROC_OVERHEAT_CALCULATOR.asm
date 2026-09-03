



.MODEL SMALL


COMPARE_TEMP MACRO
    local flag_raised,end_m
    push ax
    push bx
    push cx
    push dx
     
    mov al,safe_limit[si]
    mov cl,recorded[si]
    cmp cl,al
    JG flag_raised
    jmp end_m
    flag_raised:
     mov flag,1
    end_m:
    pop dx
    pop cx
    pop bx
    pop ax
    
endm
 
.STACK 100H

.DATA

; declare variables here
recorded db 1,2,3,4,5,6,7
safe_limit db 2,3,1,5,2,6,7
flag db 0
t1 db "Day$" 
t2 db "OVERHEATED$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov si,0
main_loop:
 mov flag,0
 cmp si,7
 JGE exit_main
 COMPARE_TEMP
 cmp flag,1
 JE call_print_proc
 inc si
 jmp main_loop
 
 call_print_proc:
  call PRINT_DAY
  inc si
  jmp main_loop
 
 
exit_main:
 
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
  PRINT_DAY PROC
    mov ah,9
    lea dx,t1
    int 21h
    mov ax,si
    mov dl,al
    mov ah,2
    add dl,30h
    int 21h
    mov ah,9
    lea dx,t2
    int 21h
    mov ah,2
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h 
    ret 
  endp
    END MAIN
