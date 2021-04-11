global solve

section .data
	two dd 2

section .text

solve:
	push ebp
	mov ebp, esp
	push ebx

	mov eax, [ebp + 12]	 
	imul eax
	mov ecx, eax
	mov eax, 4
	imul dword [ebp + 8]
	imul dword [ebp + 16]
	sub ecx, eax

	push ecx
	call sqrt
	add esp, 4

	mov ecx, eax	
	
	mov eax, [ebp + 12]
	neg eax
	add eax, ecx
	
	mov ebx, eax
	mov eax, [ebp + 8]	
	imul dword [two]
	cdq

	mov edx, eax
	mov eax, ebx
	mov ebx, edx
	
	cdq
	idiv ebx
	
	mov edx, [ebp + 20]
	mov [edx], eax

	mov eax, [ebp + 12]
	neg eax
	sub eax, ecx
	
	mov ebx, eax
	mov eax, [ebp + 8]	
	imul dword [two]

	mov edx, eax
	mov eax, ebx
	mov ebx, edx
	
	cdq
	idiv ebx
	
	mov edx, [ebp + 24]
	mov [edx], eax

	pop ebx
	pop ebp
	ret

sqrt:
	push ebp
	mov ebp, esp
	
	xor ecx, ecx
.loop:
	mov eax, ecx
	imul eax	
	cmp eax, [ebp + 8]
	jae .loop_end

	inc ecx	
	jmp .loop
.loop_end:
	mov eax, ecx

	pop ebp
	ret



