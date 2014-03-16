;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; ╔══╦╗╔╦╗─╔╦══╦════╦══╦══╦╗─╔╗
; ║╔═╣║║║╚═╝║╔═╩═╗╔═╩╗╔╣╔╗║╚═╝║
; ║╚═╣║║║╔╗─║║───║║──║║║║║║╔╗─║
; ║╔═╣║║║║╚╗║║───║║──║║║║║║║╚╗║
; ║║─║╚╝║║─║║╚═╗─║║─╔╝╚╣╚╝║║─║║
; ╚╝─╚══╩╝─╚╩══╝─╚╝─╚══╩══╩╝─╚╝
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;
;aStrCmp Function
;
;si- 1 string di-2 string
;
;;;;;;;;;;;;;;;;;;;;
aStrCmp:
	xor dx,dx
	aStrCmp_loop:
		mov al,byte [si]
		inc si
		mov ah,byte [di]
		inc di
		test al,al
		jnz aStrCmp_step1
		test ah,ah
		jz aStrCmp_equ
		aStrCmp_step1:
			cmp al,ah
			je aStrCmp_loop
	inc dx
	aStrCmp_equ:
	test dx,dx
ret
;-------------------

;;;;;;;;;;;;;;;;;;;;
;hWrite
;
;al- hex number for writing
;
;;;;;;;;;;;;;;;;;;;;
hWrite:
	xor cl,cl
	mov dl,al
	shr al,4
	hWrite_print:
		cmp al,9
		ja hWrite_notdigit
		hWrite_digit:
			add al,'0'
			jmp hWrite_printHexDigit
		hWrite_notdigit:
			add al,'A'-0ah
		hWrite_printHexDigit:
		mov ah,0eh
		mov bh,0
		int 10h
		test cl,cl
		jnz hWrite_printFinish
		mov al,dl
		inc cl
		and al,0fh
		jmp hWrite_print
	hWrite_printFinish:
ret
;-------------------

;;;;;;;;;;;;;;;;;;;;
;aWrite Function
;
;mov  si, message
;Message must be end by zero
;;;;;;;;;;;;;;;;;;;;
aWrite:
	cld
	mov  ah, 0x0E
	mov  bh, 0x00
	aWrite_puts_loop:
		lodsb
		test al, al
		jz   aWrite_puts_loop_exit
		int  0x10
		jmp  aWrite_puts_loop
	aWrite_puts_loop_exit:
ret
;-------------------

;;;;;;;;;;;;;;;;;;;;
;aRead Funtion
;
;mov di,buff
;Nothing good :(
;;;;;;;;;;;;;;;;;;;;
aRead:
	mov dx,di
	aRead_gets_loop:
		mov ah,0
		int 0x16
		cmp al,0x0d
		je aRead_gets_loop_exit
		cmp al,0x08
		jne aRead_gets_loop_next
			cmp di,dx
			jbe aRead_gets_loop
			mov ah,0x0E
			mov bh,0
			int 0x10
			mov al,' '
			int 0x10
			mov al,0x08
			int 0x10
			dec di
			mov byte [di],0
			jmp aRead_gets_loop
		aRead_gets_loop_next:
		mov [di],al
		inc di
		mov  ah, 0x0E
		mov  bh, 0x00
		int 0x10
		jmp aRead_gets_loop
	aRead_gets_loop_exit:
	mov byte [di],0
	mov ah,0x0E
	mov bh,0
	int 0x10
	mov al,0x0a
	int 0x10
ret
;-------------------
