[BITS 16]	

	mov ax, 07C0h
	mov ds, ax
	mov si, welcome

REPEAT:
    mov al, [si]
    test al, al
    jz EXIT
     
    mov ah, 0x0e
    mov bl, 7
      	
	int 0x10	
    inc si

    jmp REPEAT

EXIT:
	jmp	$ 					;infinite loop!

	welcome db	"Welcome nevermoreOS!", 0

	times 510 - ($ - $$) db 0	; Pad remainder of boot sector with 0s	
	dw 0xAA55					; The standard PC boot signature	