 .MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 

ask db 'Enter a digit: $'
result db "My favourite digit is: $"


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 
LEA DX, ask
MOV AH,9
int 21h

MOV AH,1
INT 21h
MOV BL,AL

MOV AH,2
MOV DL, 10
INT 21h 
MOV AH,2
MOV DL,13
INT 21h

LEA DX,result
MOV ah,9
int 21h
mov dl,bl
mov ah,2
int 21h






 

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
