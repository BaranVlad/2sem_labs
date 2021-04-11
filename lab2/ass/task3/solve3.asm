global solve

section .data
	ten dd 10

section .text

solve:
	push ebp
	mov ebp, esp
	push ebx
	
	mov ecx, [ebp + 8]
	xor ebx, ebx

.lp: 
	cmp ecx, 0
	je .lpq
	
	mov eax, ecx
	cdq
	idiv dword [ten]
	add ebx, edx
	
	mov ecx, eax
	jmp .lp
.lpq:
	mov eax, ebx

	pop ebx
	pop ebp
	ret


