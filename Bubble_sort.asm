.MODEL SMALL

.STACK 100H
.DATA
; declare variables here
a db 3,2,4,6,1
outer_idx db 0
.CODE
MAIN PROC
; initialize DS
MOV AX,@DATA
MOV DS,AX

; enter your code here
mov bl,outer_idx
outer:
 mov dh,3            ; outer runs bl = 0..3  (n-2 = 3 for n=5)
 cmp bl,dh
 JG exit
 mov cl,0            ; inner loop index j, starts at 0 each pass
 inner:
   mov ch,0
   mov dl,4           ; inner runs j = 0 .. (n-2-bl)
   sub dl,bl
   cmp cl,dl
   JGE inner_exit     ; JGE, since dl is the exclusive upper bound
   mov si,cx
   mov al,a[si]        ; al = a[j]
   inc si
   mov ah,a[si]        ; ah = a[j+1]
   cmp al,ah
   JLE no_swap         ; already in order, skip swap
   swap:
      mov a[si],al     ; a[j+1] = al
      dec si
      mov a[si],ah     ; a[j]   = ah
   no_swap:
      inc cl
      jmp inner
 inner_exit:
   inc bl
   jmp outer

exit:
;exit to DOS

MOV AX,4C00H
INT 21H
MAIN ENDP
    END MAIN
