.586
 INCLUDE io.h
.MODEL FLAT
.STACK 4096
.DATA
    number1 DWORD ?
	number2 DWORD ?
	number3 DWORD ?

	prompt1 BYTE "Enter Number1",0
	prompt2 BYTE "Enter Number2",0
	prompt3 BYTE "Enter Number3",0

	string BYTE 20 DUP(?)
	result BYTE 20 DUP(?)
	resultlbl BYTE "The Result Is:",0

.CODE
	_MainProc PROC
		input prompt1,string,40
		atod string
		MOV number1,eax
		input prompt2,string,40
		atod string
		MOV number2,eax
		input prompt3,string,40
		atod string
		MOV number3,eax

		MOV ebx,2
		MUL ebx
		MOV number3,eax    ;number3*=2

		MOV eax,number1
		ADD number2,eax   ;number2 += number1

		MOV eax,number3

		SUB number2,eax   ;number2 -= number3

		MOV eax,1
		ADD number2,eax

		NEG number2
		dtoa result,number2
		output resultlbl,result
	 MOV eax,0
	 ret
	_MainProc ENDP
END