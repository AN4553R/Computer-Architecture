; Suppose that someone has a certain number of coins (pennies, nickels,dimes, quarters, fifty-cent pieces, and dollar coins)
; and wants to know the total value of the coins, as well as how many coins there are.
; Write a complete 80x86 assembly language to help.
.586
.MODEL FLAT
INCLUDE io.h    
.STACK 4096
.DATA
	p1 BYTE "Enter pennies: ",0
	p2 BYTE "Enter nickels: ",0
	p3 BYTE "Enter dimes: ",0
	p4 BYTE "Enter quarters: ",0
	p5 BYTE "Enter fifty-cent pieces: ",0
	p6 BYTE "Enter dollars: ",0

	string BYTE 40 DUP(?)
	dollars DWORD 150 DUP(?),0
	cents DWORD 10 DUP(?),0
	dollarsRes BYTE "your dollars = ",0
	centsRes BYTE "your cents = ",0
.CODE
_MainProc PROC
	input p1,string,40
	atod string
	mov ecx,eax ; exc = pennies/cents

	input p2,string,40
	atod string
	imul eax,5
	add ecx,eax ; ecx += nickles to cents

	input p3,string,40
	atod string
	imul eax,10
	add ecx,eax ; ecx += dimes to cents

	input p4,string,40
	atod string
	imul eax,25
	add ecx,eax ; ecx += quarters to cents

	input p5,string,40
	atod string
	imul eax,50
	add ecx,eax ; ecx += fifty-cent pieces to cents

	input p6,string,40
	atod string
	imul eax,100
	add ecx,eax ; ecx += dollars to cents

	dtoa dollars,ecx
	mov edx,0
	mov cents,100
	mov eax,ecx
	div cents
	dtoa dollars,eax
	output dollarsRes,dollars
	
	dtoa cents,edx
	output centsRes,cents
	ret
_MainProc ENDP
END          
