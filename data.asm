;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; ╔══╗╔══╦════╦══╗
; ║╔╗╚╣╔╗╠═╗╔═╣╔╗║
; ║║╚╗║╚╝║─║║─║╚╝║
; ║║─║║╔╗║─║║─║╔╗║
; ║╚═╝║║║║─║║─║║║║
; ╚═══╩╝╚╝─╚╝─╚╝╚╝
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

aSpace:
	db ' ',0
aEnter:
	db   '$',0
aMessage1:
	db 'Hi, my dear friend!!!',0dh,0ah,0
aMessage2:
	db 'I am fine',0dh,0ah,0
aCommand1:
	db 'Hello',0
aCommand2:
	db 'How',0
aBuff:
	times 20 db 0
