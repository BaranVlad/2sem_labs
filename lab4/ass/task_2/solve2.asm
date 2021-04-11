global solve2a, solve2b

section .text

solve2a:
	push ebp 
	mov ebp, esp

	push ebx
	push edi
	push esi

	mov eax, [ebp + 8]
	mov edx, [ebp + 12]

	xor ecx, ecx
.lp1:
	cmp ecx, edx
	je .lp1q	
	
	mov ebx, ecx
	mov esi, [eax + ecx * 4]
	mov edi, ecx

	push ecx
	dec ecx
.lp2:
	inc ecx
	cmp ecx, edx
	je .lp2q

	cmp [eax + ecx * 4], esi
	jge .lp2	
	
	mov esi, [eax + ecx * 4]	
	mov edi, ecx

	jmp .lp2
.lp2q:
	pop ecx
	
	mov ebx, [eax + ecx * 4]
	mov [eax + ecx * 4], esi
	mov [eax + edi * 4], ebx 
	
	inc ecx
	jmp .lp1
.lp1q:

solve2aq:
	pop esi
	pop edi
	pop ebx

	pop ebp
	ret


solve2b:
	push ebp
	mov ebp, esp
	push ebx
	
	mov eax, [ebp + 8]
	mov edx, [ebp + 12]
	
	xor ecx, ecx
.lp1:
	cmp ecx, edx
	je .lp1q
	
	push ecx	
	inc ecx
.lp2:
	dec ecx
	cmp ecx, 0
	je .lp2q

	mov ebx, [eax + ecx * 4 - 4]
	cmp ebx, [eax + ecx * 4]
	jle .lp2q	

	xchg ebx, [eax + ecx * 4]
	mov [eax + ecx * 4 - 4], ebx
	jmp .lp2
.lp2q:
	pop ecx
	
	inc ecx	
	jmp .lp1
.lp1q:
solve2bq:
	pop ebx
	pop ebp
	ret
	


