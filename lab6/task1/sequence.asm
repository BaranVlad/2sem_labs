global sequence_1
global sequence_2
global sequence_3

section .text

sequence_1:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]
	fld qword [eax]
	mov eax, [ebp + 12]
	fld qword [eax]
	fdivp
	
	fptan
	fdiv st0, st1

	mov eax, [ebp + 8]
	fld qword [eax]
	fmul qword [eax]

	fmul st0, st2
	
	mov eax, [ebp + 12]
	fld qword [eax]
	fmul qword [eax]

	fmul st0, st2
	
	fadd st0, st1
	
	mov eax, [ebp + 16]
	fstp qword [eax]	

	pop ebp
	ret

sequence_2:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]
	mov ecx, [ebp + 12]
	mov edx, [ebp + 16]

	fld qword [eax]		; x*y
	fmul qword [ecx]	;
		
	fld qword [ecx]		; y*log2x
	fld qword [eax]		; 
	fyl2x				;

	faddp				; x*y + y*log2x

	fld qword [eax]		; arctg(x/y)
	fld qword [ecx]		;
	fpatan

	fdivp				; (x*y + y*log2x) / arctg(x/y)
	fstp qword [edx]	

	pop ebp
	ret

sequence_3:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 8]	
	mov ecx, [ebp + 12]	
	mov edx, [ebp + 16]	

	fld qword [eax]
	fsub qword [ecx]
	fabs

	fld qword [eax]
	fdiv qword [ecx]
	
	fld qword [ecx]
	fdiv qword [eax]
	
	faddp
	fcos	
	fmulp

	fst qword [edx]

	pop ebp
	ret

