.MODEL SMALL

print_num macro num
    mov dl,num
    mov ah,2
    int 21h
    
    
endm








 
.STACK 100H

.DATA

; declare variables here
arr db 1,2,3,4


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

Call print_arr


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP 



print_arr proc
     lea si,arr
     mov cx,4
     loop_start:
        mov al,arr[si]
        add al,30H
        print_num al
        inc si
     loop loop_start
     ret
    
    




endp


    END MAIN
