.MODEL SMALL

print_sum macro num
    mov al,num
    mov ah,0
    mov bl,10
    div bl

    mov dl,al
    add dl,30H
    mov cl,ah

    mov ah,2
    int 21h

    mov dl,cl
    add dl,30H
    mov ah,2
    int 21h
endm

print_avg macro num
    mov dl,num
    add dl,30H
    mov ah,2
    int 21h 
endm








 
.STACK 100H

.DATA

; declare variables here
arr db 1,2,3,4
sum db ?
avg db ?


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

call calculate_sum
call calculate_avg
print_sum sum
print_avg avg
 
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP 


 calculate_sum proc
    mov dl,0
     lea si,arr
     mov cx,4
     loop_start:
        mov al,arr[si]
        add dl,al
        inc si
     loop loop_start
     mov sum,dl
     ret
     endp
calculate_avg proc
    mov al,sum
    mov ah,0
    mov bl,4
    div bl
    mov avg,al
    ret
endp


    END MAIN
