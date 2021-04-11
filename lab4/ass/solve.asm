global solve2a
golbal solve2b

section .text

solve2a:
	push ebp 
	mov ebp esi

	push ebx
	push edi
	push esi

	mov eax, [ebp + 8]
	mov edx, [ebp + 12]

	xor ecx, ecx
lp1:
	cmp ecx, edx
	je lp1q	
	
	mov ebx, ecx
	mov esi, [eax + ecx * 4]
	mov edi, ecx

	push ecx
lp2:
	cmp esi, [eax + ecx * 4]
	jge lp2q	
	
	mov esi, [eax + ecx * 4]	
	mov edi, ecx
lp2q:
	pop ecx
	
	mov ebx, [eax + ecx * 4]
	mov [eax + ecx * 4], esi
	mov [eax + edi * 4], ebx 
	
	inc ecx
	jmp lp1
lp1q:
	pop esi
	pop edi
	pop ebx

	pop ebp
	ret

