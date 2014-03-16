;;;;;;;;;;;;;;;;;;;;
;
;aWriteF
;
;;;;;;;;;;;;;;;;;;;;
%macro aWriteF 1
mov si,%1
call aWrite
%endmacro
;-------------------

;;;;;;;;;;;;;;;;;;;;
;Offset to buffer
;	aReadF
;
;;;;;;;;;;;;;;;;;;;;
%macro aReadF 1
mov di,%1
call aRead
%endmacro
;-------------------

;;;;;;;;;;;;;;;;;;;;
;two offset to ascii string
;	aStrCmpF
;return zf
;;;;;;;;;;;;;;;;;;;;
%macro aStrCmpF 2
mov di,%1
mov si,%2
call aStrCmp
%endmacro
;-------------------
