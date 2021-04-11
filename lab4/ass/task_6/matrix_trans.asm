global matrix_trans

section .text

matrix_trans:
	push ebp
	mov ebp, esp
	push esi
	push edi

	mov esi, [ebp + 8]	; esi = matrix1
	mov edi, [ebp + 12] ; edi = result
	
	mov eax, [ebp + 24] ; edx = i_count
	mov ecx, 4			;
	mul ecx				;
	mov edx, eax		;
	
	
	xor ecx, ecx
.lp1:
	cmp ecx, [ebp + 16]
	jge .lp1q	
	push ecx
	push esi
	push edi
	
	xor ecx, ecx
.lp2:
	cmp ecx, [ebp + 20]
	jge .lp2q

	mov eax, [esi]
	mov [edi], eax

	inc ecx
	add esi, 4
	add edi, edx
	jmp .lp2
.lp2q:	
	pop edi
	pop esi
	pop ecx

	inc ecx
	add esi, edx
	add edi, 4
	jmp .lp1		
.lp1q:


matrix_trans_q:
	pop edi
	pop esi
	pop ebp
	ret

