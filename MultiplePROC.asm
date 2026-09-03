.MODEL SMALL

COMPARE MACRO
    push ax
    push bx
    push cx
    push dx
    local fail_flag,end_m
    mov al, scores[si]
    mov bl, thresholds[si]
    cmp al,bl
    JLE fail_flag
    add pass,1
    jmp end_m
    fail_flag:
     mov flag,1
     jmp end_m
    end_m:
     pop dx
     pop cx
     pop bx
     pop ax
endm

    
 
.STACK 100H

.DATA

; declare variables here

scores      db 45, 78, 30, 60, 90, 55, 40, 85
thresholds  db 50, 70, 40, 60, 65, 50, 45, 80
flag db 0
pass db 0
retaddr dw ? 

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov si,0
mov cl,0
main_loop:
 cmp si,8
 JE exit_m
 mov flag,0
 COMPARE
 cmp flag,1
 JE push_cycle
 inc si
 jmp main_loop
 push_cycle:
  mov ax,si
  push ax
  inc si
  inc cl
  jmp main_loop
 exit_m:
 
 
 pop_loop:
 call procedureone
 
 exit_pone:
  call proceduretwo
  jmp exit 



 
exit:
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    procedureone PROC
        pop retaddr
        pop_loopone:
        cmp cl,0
        JE exit_poneh
        pop ax
        mov dl,al
        add dl,30h
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        mov dl,13
        mov ah,2
        int 21h
        dec cl
        jmp pop_loopone
        
        exit_poneh:
        push retaddr
        ret
    endp
    
    proceduretwo PROC
        mov dl,pass
        add dl,30h
        mov ah,2
        int 21h
        ret 
    endp
    



    END MAIN
