global array_mult

section .data
perenos dd 0
n dd 0

section .text
array_mult:
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ebx

	mov esi, [ebp + 8]	; array1
	mov edi, [ebp + 16] ; array2
	mov ebx, [ebp + 24] ; array_res
	
	mov ecx, [ebp + 12] ; n1
	mov edx, [ebp + 20] ; n2
	
	xor eax, eax
.lp1:
	cmp eax, ecx
	jge .lp1q
	push ecx
	push edi
	
	xor ecx, ecx
.lp2:
	cmp ecx, edx
	jge .lp2q
	push eax
	push edx
	push ecx

	mov edx, eax

	mov eax, [esi]

	push edx
	mul dword [edi]
	pop edx

	add ecx, edx
	add [ebx + 4*ecx], eax
	add ecx, 1
	mov [n], ecx	
	
	add edi, 4

	pop ecx
	pop edx
	pop eax
	inc ecx	
	jmp .lp2
.lp2q:	
	pop edi
	pop ecx

	add esi, 4
	inc eax
	jmp .lp1
.lp1q:
	push ebx
	push eax
	mov edi, [n]
	
	xor ecx, ecx
	xor esi, esi
.lp_last:
	cmp ecx, edi
	jl .check1_end
	cmp [perenos], esi;0 
	jne .check2_end
	jmp .lp_last_q
.check1_end:
	mov eax, [ebx]
	jmp .checks_end
.check2_end:
	inc edi
	mov eax, 0
	jmp .checks_end
.checks_end:

	add eax, [perenos]
	cdq
	idiv dword [ebp + 28]
	mov [ebx], edx	
	mov [perenos], eax
	
	inc ecx
	add ebx, 4	
	jmp .lp_last	
.lp_last_q:

	pop eax
	pop ebx

	mov eax, edi	
array_mult_q:
	pop ebx
	pop edi
	pop esi
	pop ebp
	ret

