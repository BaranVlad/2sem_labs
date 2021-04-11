%include "../float.asm"

global calculate_pi
global get_fldpi

section .bss
temp resq 1

section .data
last_val dq 0

section .text

calculate_pi:
	push ebp
	mov ebp, esp
	push esi
	push edi

	mov esi, [ebp + 8]
	mov edi, [ebp + 12]
	
	mov ecx, 0
	mov edx, -1

	fld_reg ecx
.lp:		
	neg edx
	inc ecx

	fld_reg ecx
	fmul st0, st0	
	
	fld_reg edx
	fdivrp
	fadd st1, st0
	fabs
	
	fst qword [temp]
	fld qword [last_val]
	fabs
	fld qword [temp]
	fstp qword [last_val]
	
	fsubp st1, st0
	fabs
	fld qword [esi]
	fcompp_ 
	jb .lp
	
	mov eax, 12
	fld_reg eax
	fmulp
	fsqrt
	fstp qword [edi]

	
calculate_pi_q:
	pop edi
	pop esi
	pop ebp
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
get_fldpi:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]

	fldpi		
	fstp qword [eax]

	pop ebp	
	ret




