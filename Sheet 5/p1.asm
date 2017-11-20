; Write a complete 80x86 assembly language program to prompt for values of x, y
; and z and display the value of the expression: – (x + y – 2 * z + 1).

.586
.MODEL FLAT
INCLUDE io.h    
.STACK 4096
.DATA
	endc DWORD ?
	p1 BYTE "Enter x",0
	p2 BYTE "Enter y",0
	p3 BYTE "Enter z",0
	string BYTE 40 DUP(?)
	value BYTE 11 DUP(?),0
	resultlbl BYTE "even number is",0
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

	;–(x+y-2z+1)
	imul  eax , -2      ;    -2z
	add  ecx , ebx
	add  eax , ecx
	add  eax , 1 
	neg  eax
	dtoa value,eax
	output res,value
	ret
_MainProc ENDP
END          
