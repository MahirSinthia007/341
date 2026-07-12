.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 


start db ?
end db ?
temp db ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov start,080h
mov end,0ffh
mov dl,start
mov temp,dl
Main_Loop:
  mov cl,temp
  mov bl,end
  cmp cl,bl
  JGE Exit 
  mov cx,10
  mov bx,0
  Printing_Loop:
    cmp cx,bx
    JE New_line
    mov al,temp
    cmp al,0ffh
    JG  New_line
    mov ah,2
    mov dl,temp
    int 21h
    inc dl
    mov temp,dl
    inc bx  
    JMP Printing_Loop
    
   New_Line:
   mov ah,2
   mov dl,10
   int 21h
   mov ah,2
   mov dl,13
   int 21h
   JMP Main_Loop  



Exit:



;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
