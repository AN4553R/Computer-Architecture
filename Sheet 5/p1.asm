; Write a complete 80x86 assembly language program to prompt for values of x, y
; and z and display the value of the expression: – (x + y – 2 * z + 1).

.586
 INCLUDE io.h
.MODEL FLAT
.STACK 4096
.DATA
    number1 DWORD ?
    number2 DWORD ?
    number3 DWORD ?

	prompt1 BYTE "Enter Number 1",0
	prompt2 BYTE "Enter Number 2",0
	prompt3 BYTE "Enter Number 3",0

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
		MOV number3,eax    ; num3 = num3 * 2

		MOV eax,number1
		ADD number2,eax    ; num2 = num2 + num1

		MOV eax,number3

		SUB number2,eax    ; num2 = num2 - num3

		MOV eax,1
		ADD number2,eax

		NEG number2
		dtoa result,number2
		output resultlbl,result
	 MOV eax,0
	 ret
	_MainProc ENDP
END
