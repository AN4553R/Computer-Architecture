; Write a complete 80x86 assembly language program to prompt for four grades
; and then display the sum and the average (sum/4) of the grades

.586
.MODEL FLAT
INCLUDE io.h    
.STACK 4096
.DATA
	p1 BYTE "Enter grade 1: ",0
	p2 BYTE "Enter grade 2: ",0
	p3 BYTE "Enter grade 3:",0
	p4 BYTE "Enter grade 4: ",0

	string BYTE 40 DUP(?)
	value BYTE 11 DUP(?),0
	sum BYTE "numbers sum is",0
	avg BYTE "numbers avg is",0

.CODE
_MainProc PROC
	input p1,string,40
	atod string
	mov ebx,eax

	input p2,string,40
	atod string
	add ebx,eax

	input p3,string,40
	atod string
	add ebx,eax
	
	input p4,string,40
	atod string
	add ebx,eax

	dtoa value,ebx
	output sum,value

	mov edx,0
	mov eax,ebx
	mov ebx,4
	div ebx

	dtoa value,eax
	output avg,value
	ret
_MainProc ENDP
END          
