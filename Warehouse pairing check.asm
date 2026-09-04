.MODEL SMALL
CROSS_COMPARE MACRO
    local overlimit_change,exit_m
    push ax
    push bx
    push cx
    push dx
    
   mov ax,arr1[si]
   mov bx,arr2[di]
   add ax,bx
   cmp ax,limit
   JG overlimit_change
   jmp exit_m
   overlimit_change:
    mov overlimit,1
    mov sum,ax
    mov index,si
    jmp exit_m
   exit_m:
   pop dx
   pop cx
   pop bx
   pop ax
endm

 
.STACK 100H

.DATA

; declare variables here

arr1  dw 12, 45, 78, 30, 60, 90
arr2  dw 55, 20, 15, 65, 40, 25
limit dw 100
overlimit dw 0
sum dw 0
index dw 0
t1 dw "Pair $"
t2 dw ": $"





.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov si,0
mov di,10

main_loop:
 cmp si,12
 JGE exit
 CROSS_COMPARE
 cmp overlimit,1
 JE call_proc
 add si,2
 sub di,2
 jmp main_loop
 
 
 call_proc:
  mov overlimit,0
  call procedureLimit
  add si,2
  sub di,2
  jmp main_loop
   


exit:

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
     procedureLimit PROC
       lea dx,t1
       mov ah,9
       int 21h
       
       mov dx,index
       mov al,dl
       mov ah,0
       mov cl,2
       div cl
       mov dl,al
       add dl,1
       add dl,30h
       mov ah,2
       int 21h
       
       lea dx,t2
       mov ah,9
       int 21h
       
       mov bx,10
       mov dx,0
       mov ax,sum
       mov cx,0
       
       main_push_loop:
        cmp ax,0
        JE main_pop_loop
        div bx
        push dx
        mov dx,0
        inc cx
        jmp main_push_loop
       main_pop_loop:
        pop dx
        add dl,30h
        mov ah,2
        int 21h
        loop main_pop_loop
     mov dl,10
     mov ah,2
     int 21h
     mov dl,13
     mov ah,2
     int 21h   
     
     ret 
     endp
     
       

    END MAIN
