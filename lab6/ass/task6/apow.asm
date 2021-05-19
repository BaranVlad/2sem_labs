global apow

section .bss
	temp resd 1 		; int temp

section .text

; apow(double* a, double* x)
apow:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]	
	mov edx, [ebp + 12]

	fld qword [edx]
	fld qword [eax]
	fyl2x					; calculate x * log2(a)

	fist dword [temp]		; calculating fractional part of number
	fild dword [temp]		; push rounded number
	fild dword [temp]		;
	fsubr st0, st2			;
	
	f2xm1					; calculate 2^(fractional part(x*log2(a)))
	fld1					;
	faddp					;

	; calculate answer
	; st1 = integer part
	; fscale is (st0 = st0 * 2^st1)
	; total st0 = 2^(frac_part(x*log2(a)) * 2^(int_part(x*log2(a))) =
	; = 2^(x*log2(a))
	fscale					

	fstp st1				; clear stack
	fstp st1				; 

apow_q:
	pop ebp
	ret


