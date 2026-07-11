 .MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
str db "Equal$" 
str1 db "Greater$"
str2 db "Lesser$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

; BRANCHING CW CODE

;; BL
;MOV BL, 00h
;; input
;mov ah,1
;int 21h ; input -> al 
;sub al,30h
;
;; branching
;cmp al,bl
;JE EQUAL
;JG GREATER
;JL LESSER 
;JMP END_Block
;
;EQUAL:
;    mov ah,9
;    lea dx,str
;    int 21h   
;
;GREATER:
;    mov ah,9
;    lea dx,str1
;    int 21h
;    
;LESSER:
;    mov ah,9
;    lea dx,str2
;    int 21h
     
; EXPLICIT LOOP
; task: print 1 to 5
;mov dl, 31h
;mov ah,2
;LOOP_START:
;    cmp dl, 35h
;    jg END_Block
;    int 21h 
;    inc dl
;    jmp loop_start
;END_Block:        
;MOV AX,4C00H
;INT 21H  
;
;; task: print a to e
;;mov dl, 61h   
;mov dl,'a'
;mov ah,2
;LOOP_START:
;    ;cmp dl, 65h 
;    cmp dl,'f'
;    jg END_Block
;    int 21h 
;    inc dl 
;    mov bl,dl 
;    ; new line
;    mov ah,2
;    mov dl, 10
;    int 21h
;    mov ah,2
;    mov dl,13
;    int 21h 
;    
;    mov dl,bl
;    jmp loop_start
;END_Block:        
;MOV AX,4C00H
;INT 21H 
;
; IMPLICIT LOOP
mov dl,31h
mov cx,5
mov ah,2
Implicit:
    int 21h
    inc dl
loop implicit

MAIN ENDP
    END MAIN
