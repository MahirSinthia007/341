.MODEL SMALL
 
.STACK 100H
.DATA
; declare variables here 
input db 100 dup(?) 
data1 db "ENTER A STRING OF CAPITAL LETTERS: $"
temp db ?
length db ?
i db ?
output db 100 dup (?)
data2 db " THE LONGEST CONSECUTIVELY INCREASING STRING IS: $"
j db ?
best db 100 dup (?)
b db ?
.CODE
MAIN PROC
; initialize DS
MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov ah,9
lea dx,data1
int 21h
mov length,0
mov i,0    
mov b,0
Input_Loop:
  mov ah,1
  int 21h
  cmp al,13
  je Done
  
  mov bl,length
  mov bh,0
  
  mov input[bx],al
  
  inc length
  
  jmp Input_Loop
 Done:
 mov temp,0
 
 Main_Loop:
   mov al,length
   dec al
   cmp temp,al
   JGE Exit_Logic
   mov bl,temp
   mov bh,0
   mov cl,input[bx]
   mov dl,input[bx+1]
   inc cl
   cmp dl,cl
   JL reset
   JG reset
   JE no_reset
no_reset:
   mov bl,temp
   mov bh,0
   mov al,input[bx]
   mov bl,i
   mov bh,0
   mov output[bx],al
   cmp b,bl              
   jle update_best
   jg increment
 update_best:
   mov j,0
 copy_best_loop:
   mov bl,j
   mov bh,0
   mov al,i
   cmp bl,al
   jg copy_best_done
   mov al,output[bx]
   mov best[bx],al
   inc j
   jmp copy_best_loop
 copy_best_done:
   mov al,i
   inc al
   mov b,al
   jmp increment
 increment:  
   inc i
   inc temp
   JMP Main_Loop
   
 reset:
   mov i,0
   inc temp
   JMP Main_Loop
   
 Exit_Logic:
  lea dx,data2
  mov ah,9
  int 21h
  mov j,0
  
  LOOP1:
  mov bl,b
  cmp bl,j
  JE exit
  mov bl,j
  mov bh,0
  mov dl,best[bx]
  inc j
  mov ah,2
  int 21h
  JMP LOOP1
 exit:
 
;exit to DOS
               
MOV AX,4C00H
INT 21H
MAIN ENDP
    END MAIN