%include "../float.asm"

global get_ln2
global get_fld_ln2

section .bss
temp resq 1

section .data
last_val dq 0

section .text

get_ln2:
	push ebp
	mov ebp, esp
	push esi
	push edi

	mov esi, [ebp + 8]
	mov edi, [ebp + 12]
	
	mov ecx, 0
	fld_reg ecx
.lp:		
	inc ecx

	fld_reg ecx
	fmul st0, st0	

	mov eax, 4
	fld_reg eax
	fmulp
	mov eax, 1
	fld_reg eax
	fsubp
	fld_reg ecx
	fmulp
	
	mov eax, 1
	fld_reg eax
	fdivrp
	fadd st1, st0
	
	fst qword [temp]
	fld qword [last_val]
	fld qword [temp]
	fstp qword [last_val]
	
	fsubp st1, st0
	fabs
	fld qword [esi]
	fcompp_ 
	jb .lp
	
	mov eax, 1
	fld_reg eax
	faddp
	mov eax, 2
	fld_reg eax
	fdivp
	fstp qword [edi]

	
get_ln2_q:
	pop edi
	pop esi
	pop ebp
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
get_fld_ln2:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]

	fldln2	
	fstp qword [eax]

	pop ebp	
	ret




