.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
input db ?
data1 db "30 days $"
data2 db "31 days $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov ah,1
int 21h
sub al,48
mov dl,al 

cmp al,1
JE maybe_double

maybe_double:
mov ah,1
int 21h
mov cl,13
cmp al,cl
JE rest_of_code
sub al,48
add al,10
mov dl,al


rest_of_code:
mov input,dl



mov ah,2
mov dl,10
int 21h

mov ah,2
mov dl,13
int 21h


mov cl,2
mov al,input
mov ah,0
div cl
cmp ah,0
JE greater_than_6
JNE greater_than_7



greater_than_7:
mov cl,7
mov al,input
cmp al,cl
JLE thirtyone_days
JMP thirty_days


greater_than_6:

mov cl,6
mov al,input
cmp al,cl
JLE thirty_days
mov ah,9
lea dx,data2
int 21h
JMP exit


thirtyone_days:
mov ah,9
lea dx,data2
int 21h 
JMP exit

thirty_days:

mov ah,9
lea dx,data1
int 21h









exit:
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
