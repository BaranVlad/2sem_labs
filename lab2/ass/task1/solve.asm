global solve_asm

section .text

solve_asm:
	push ebp
	mov ebp, esp
	push ebx
	
	mov ebx, [ebp + 8]
	mov eax, [ebp + 12]
	neg ebx

	cmp ebx, 0
	je no_solve		

	cdq	
	idiv ebx
	
	mov ecx, [ebp + 16]
	mov [ecx], eax
	mov eax, 0
	
	jmp solve_end		

no_solve:
	cmp eax, 0
	je inf_solve	
	
	mov eax, 1
	jmp solve_end

inf_solve:
	mov eax, 2
	jmp solve_end

solve_end:

	pop ebx
	pop ebp
	ret

