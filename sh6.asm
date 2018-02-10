.586
.MODEL FLAT
.STACK 4096
INCLUDE io.h
.DATA
	lbl		BYTE	"Enter Number Of Bounders", 0
	mes		BYTE	"The Number Is", 0
	res		BYTE	40 DUP (?)
	inp		BYTE	40 DUP (?)
	tem		DWORD	?
.CODE
_MainProc	PROC
	input	lbl, inp, 40
	atod	inp
	mov		ecx, eax
	mov		eax, 1
	mov		ebx, 1
	My_Loop:
		dtoa	res, eax
		output	mes, res
		mov		tem, ebx
		add		ebx, eax
		mov		eax, tem
		loop	My_Loop
			ret
_MainProc	ENDP
END	
