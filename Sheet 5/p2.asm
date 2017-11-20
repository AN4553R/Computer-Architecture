; Write a complete 80x86 assembly language program to prompt for
; values of x, y, and z and display the value of the expression 2(x+y) + z.

.586
.MODEL FLAT
INCLUDE io.h    
.STACK 4096
.DATA
	p1 BYTE "Enter x",0
	p2 BYTE "Enter y",0
	p3 BYTE "Enter z",0
	string BYTE 40 DUP(?)
	value BYTE 11 DUP(?),0
	res BYTE "the result is",0
.CODE
_MainProc PROC
	input p1,string,40
	atod string
	mov ecx,eax ;x

	input p2,string,40
	atod string
	mov ebx,eax ;y

	input p3,string,40
	atod string         ;eax=z

	; ecx=x , ebx=y
	; 2(x+y) + z
	
	add  ecx , ebx
	imul  ecx , 2

	add  eax , ecx
	dtoa value,eax
	output res,value
	ret
_MainProc ENDP
END          
