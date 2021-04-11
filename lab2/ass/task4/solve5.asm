global solve5

section .data
	ten dd 10

section .text
solve5:
	push ebp
	mov ebp, esp
	push ebx
	push edi

	mov ecx, [ebp + 8]
	xor ebx, ebx
.lp:
	cmp ecx, 0
	je .lpq
	
	mov eax, ecx
	cdq
	idiv dword [ten]
	
	mov ecx, eax
	mov edi, edx
	mov eax, ebx
	imul dword [ten]
	add eax, edi
	mov ebx, eax	
	
	jmp .lp
.lpq:
	mov eax, ebx
	
	pop edi
	pop ebx
	pop ebp
	ret

