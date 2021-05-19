%include "../float.asm"
; fld_reg - upload register to st0

global integral 

section .bss

sstack resb 108 	; using for fsave
temp resq 1

l resq 1			; left bound
r resq 1			; right bound
step_size resq 1	; size of segment

steps resd 1		; steps count

section .text

%macro fx 1			; this macro calculate f(x), x from memory. f(x) in st0
	fld qword [%1] 
	fmul st0
	fld qword [%1]
	fsin
	faddp
%endmacro

integral_step: ;;; this function calculate integral depending steps var
	;;; calculating step_size
	fld qword [l]
	fsubr qword [r]
	fild dword [steps]
	fdivp
	fstp qword [step_size]
	;;;

	mov ecx, 0
	fld_reg ecx		; answer is the deepest in stack
	fx l			; the next in stack is previous f(x) (f(x1))
	fld qword [l] 	; the next is current x (x2)
.lp:
	inc ecx	
	fadd qword [step_size]	; next f(x)

	fstp qword [temp]		; save x2
	fx temp					; calculating f(x2)

	fadd st0, st1			; f(x1) + f(x2)
	
	mov eax, 2				; (f(x1) + f(x2)) / 2
	fld_reg eax				;
	fdivp					;
	fmul qword [step_size]	; h * (f(x1) + f(x2)) / 2
	
	fadd st2, st0			; add current area to result
	fstp st0

	fx temp					; f(x1) to st0
	fxch st1				; refresh previous f(x1) by swaping s0, st1
	
	fstp st0				; deleted unnecessary previous f(x1)
	fld qword [temp]		; restore x2
	
	cmp ecx, [steps]
	jl .lp

	fstp st0				; leave only answer in stack
	fstp st0
	
	ret


; intergral l to r by precision
integral:
	push ebp
	mov ebp, esp
	push ebx

	;;; loading l, r, presicion
	mov eax, [ebp + 8]
	mov ebx, [ebp + 12]
	mov ecx, [ebp + 16]

	fld qword [eax]
	fld qword [ebx]

	fstp qword [r]
	fstp qword [l]
	;;;

	mov dword [steps], 1000
	call integral_step

	pop ebx
	pop ebp
	ret

