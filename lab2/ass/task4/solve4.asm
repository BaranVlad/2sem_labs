global solve4
extern solve5

section .data
	ten dd 10

section .text
solve4:
	push ebp
	mov ebp, esp
	push edi
	push ebx
	
	mov ecx, [ebp + 8]
	push ecx
	call solve5
	add esp, 4
	mov ecx, eax

	xor ebx, ebx
.lp:
	cmp ecx, 0
	je .lpq	

	mov eax, ecx
	idiv dword [ten]	
	mov ecx, eax
	mov edi, edx
	mov eax, ebx
	imul dword [ten]	
	add eax, edi 
	
	cmp edi, 1
	je .add_one
.back:
	mov ebx, eax	

	jmp .lp

.add_one:
	imul dword [ten]	
	add eax, 1 
	
	jmp .back
.lpq:		

	mov eax, ebx
		
	pop ebx
	pop edi
	pop ebp
	ret
		

