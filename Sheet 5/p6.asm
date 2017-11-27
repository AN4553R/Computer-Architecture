.586
.MODEL FLAT
INCLUDE io.h    
.STACK 4096
.DATA
	p1 BYTE "Enter a grade",0
	p2 BYTE "Enter Weight of the grade",0
	
	string BYTE 40 DUP(?)
	value BYTE 11 DUP(?),0
	
	state1 BYTE "the weighted sum equal",0
	state2 BYTE "the sum of weights equal",0
	state3 BYTE "the weighted average equal",0


.CODE
_MainProc PROC
	mov ebx,0 ; sum of weights
	mov ecx,0 ; weighted sum
	mov cx, 4

	_loop:
		input p1,string,40
		atod string
		mov edx,eax

		input p2,string,40
		atod string
		add ebx,eax
		imul edx,eax
		add ecx,edx
	loop _loop

	dtoa value,ebx
	output state2,value

	dtoa value,edx
	output state1,value
	ret
_MainProc ENDP
END          
