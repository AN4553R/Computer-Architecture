; Write a complete 80x86 assembly language program to prompt for the
; length and width of a rectangle and to display its perimeter (2 * length + 2*width).

.586
.MODEL FLAT
INCLUDE io.h    
.STACK 4096
.DATA
	p1 BYTE "Enter length: ",0
	p2 BYTE "Enter width: ",0

	string BYTE 40 DUP(?)
	value BYTE 11 DUP(?),0
	res BYTE "the result is",0
.CODE
_MainProc PROC
	input p1,string,40
	atod string
	mov ecx,eax ;

	input p2,string,40
	atod string

	; ecx=length , eax=width
	; (2*length + 2*width)
	
	imul  ecx , 2
	imul  eax , 2

	add  eax , ecx
	dtoa value,eax
	output res,value
	ret
_MainProc ENDP
END          
