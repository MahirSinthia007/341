 .MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

str dw "Equal $"


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV BL,05h
MOV AH,1
int 21h
sub al,30h

cmp bl,al
JE  PRINT
JNE END_BLOCK




PRINT:
    mov ah,9
    lea dx,str
    int 21h 
    
END_BLOCK:
    




 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN


 .MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
str1 db "Equal$"
str2 db "Positive$"
str3 db "Negative$"


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX

MOV bl,00h

mov ah,1
int 21h
sub al,30h

cmp al,bl

JE EQUAL
JG GREATER
JL LESS

EQUAL:
   lea dx,str1
   mov ah,9
   int 21h
   JMP END1
GREATER:
   lea dx,str2
   mov ah,9
   int 21h
   JMP END1
LESS:
   lea dx,str3
   mov ah,9
   int 21h
   JMP END1
   
END1:





 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN


.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV DL,31h
MOV AH,2

LOOP_START:          ;explicit loop

     CMP DL,35h
     JE END_BLOCK
     INT 21h
     INC DL
     JMP LOOP_START

END_BLOCK:

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN


.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV BL,61h
MOV AH,2

LOOP_START:          ;explicit loop

     CMP BL,66h
     JG END_BLOCK
     MOV ah,2
     MOV dl,bl
     INT 21h
     INC BL
     MOV AH,2
     MOV DL, 10
     INT 21h 
     MOV AH,2
     MOV DL,13
     INT 21h
     JMP LOOP_START

END_BLOCK:

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN


.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov ah,1
int 21h

mov cl,al

sub cl,20h


mov ah,2
mov dl,10
int 21h

mov ah,2
mov dl,13
int 21h

mov ah,2
mov dl,cl
int 21h






 

;exit to DOS
               
MOV AX,4C00H
INT 21H

.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

asterick DB "********** $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov cx,10

LOOP1:
  lea dx,asterick
  mov ah, 9
  int 21h
  
  mov ah,2
  mov dl,13
  
  int 21h
  
  mov ah,2
  mov dl,10
  int 21h
  
  
  
  Loop LOOP1




 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN

MAIN ENDP
    END MAIN
