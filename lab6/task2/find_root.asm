global find_root

section .bss
a resq 1
b resq 1
c resq 1

l resq 1
r resq 1

lr2 resq 1
lry resq 1

presicion resq 1

ssave resb 108

;;;;;;;;;;;;;;;;;;;;;;;
section .data
two dd 2
eleven dd 11
zero dd 0
;;;;;;;;;;;;;;;;;;;;;;;
section .text

find_root:
	push ebp
	mov ebp, esp
	push ebx

	mov eax, [ebp + 8]
	mov ebx, [ebp + 12]
	mov ecx, [ebp + 16]

	fld qword [eax]
	fld qword [ebx]
	fld qword [ecx]

	fstp qword [c]
	fstp qword [b]
	fstp qword [a]

	mov esi, [ebp + 20]
	mov edi, [ebp + 24]
	mov ecx, [ebp + 28]

	fld qword [ecx]
	fstp qword [presicion]
	
	push lry
	push esi
	call calcul_seq
	add esp, 8
	
	fld qword [zero]
	fld qword [lry]
	fcompp
	fstsw ax
	sahf
	ja .default
	fld qword [esi]
	fld qword [edi]
	fstp qword [r]
	fstp qword [l]
	jmp .endif_def
.default:
	fld qword [esi]
	fld qword [edi]
	fstp qword [l]
	fstp qword [r]
.endif_def:

.lp:
	finit

	fld qword [l]
	fld qword [r]

	fld st0
	fsub st0, st2
	fabs
	fcomp qword [presicion]
	fstsw ax
	sahf
	jb .lp_q

	faddp
	fild dword [two]
	fdivp st1, st0
	fstp qword [lr2]
		
	push lry
	push lr2	
	call calcul_seq
	add esp, 8
	
	fld qword [zero]
	fld qword [lry]
	fcompp
	fstsw ax
	sahf
	ja .right
.left:
	fld qword [lr2]
	fstp qword [l]	
	jmp .endif
.right:
	fld qword [lr2]
	fstp qword [r]	
.endif:
	jmp .lp
.lp_q:
	finit

	mov eax, [ebp + 32]
	fld qword [l]
	fld qword [r]
	faddp
	fild dword [two]
	fdivp st1, st0
		
	fstp qword [eax]	

	mov eax, 1

find_root_q:


	pop ebx
	pop ebp
	ret


calcul_seq:
	push ebp
	mov ebp, esp
	fsave [ssave]

	mov eax, [ebp + 8]
	fld qword [eax]	
	fmul st0, st0
	fmul qword [a] 		; ax2
		
	fld qword [eax]
	fild dword [eleven] 
	faddp
	fld qword [b]
	fdivrp 				; b/(x + 11)
	
	faddp				; ax2 + b/(x + 11)
	fadd qword [c]		; ax2 + b/(x + 11) + c

	mov eax, [ebp + 12]
	fstp qword [eax]

calcul_seq_q:
	frstor [ssave]
	pop ebp
	ret

