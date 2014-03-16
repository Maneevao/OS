section .text
	use16
	org  0x7C00
	%include "macro.asm"
start:
	mov ax,cs
	mov ds,ax
	mov ss,ax
	mov sp,stack

Command:
	aWriteF aEnter
	aReadF aBuff

	aStrCmpF aBuff,aCommand1
	jne not_command1
Command1:
	aWriteF aMessage1
	jmp Command
not_command1:

	aStrCmpF aBuff,aCommand2
	jne not_command2
Command2:
	aWriteF aMessage2
	jmp Command
not_command2:

jmp Command

	%include "func.asm"
	%include "data.asm"
finish:
	times 0x1FE-$+$$ db 0
stack:
	db   0x55, 0xAA
	times (1474560-512) db 0
