global matrix_mult

section .data
i_count dd 0

section .text

matrix_mult:
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ebx

	;;; i_count init 
	mov eax, [ebp + 32]
	mov ecx, 4
	mul ecx
	mov [i_count], eax
	;;;

	;;; reg init
	mov esi, [ebp + 8]	
	mov edi, [ebp + 12]
	mov ebx, [ebp + 16]
	;;;

	xor ecx, ecx
.lp1:
	cmp ecx, [ebp + 20]		; ecx < n
	jge .lp1q
	push ecx
	push ebx
	push edi

	xor ecx, ecx
.lp2:
	cmp ecx, [ebp + 28] 	; ecx < m
	jge .lp2q
	push ecx
	push esi
	push edi

	xor ecx, ecx
.lp3:
	cmp ecx, [ebp + 24]		; ecx < k
	jge .lp3q

	;;; mult 
	mov eax, [esi]	
	mul dword [edi]
	add [ebx], eax
	;;;	

	add esi, 4
	add edi, [i_count]
	inc ecx
	jmp .lp3	
.lp3q:
	pop edi
	pop esi
	pop ecx

	add ebx, 4
	add edi, 4
	inc ecx
	jmp .lp2	
.lp2q:
	pop edi
	pop ebx
	pop ecx	

	add ebx, [i_count]
	add esi, [i_count]
	inc ecx
	jmp .lp1
.lp1q:


matrix_mult_q:
	pop ebx
	pop edi
	pop esi
	pop ebp
	ret

