global array_sum

section .data
perenos dd 0
four dd 4

section .text

; [ebp + 12] - n1
; [ebp + 20] - n2

array_sum:
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
lp:		
	cmp eax, ecx
	jl .end_check
	cmp eax, edx
	jl .end_check
	jmp lpq
.end_check:

	push eax
	push ecx
	push edx
	push esi
	push edi

;;;;;;;;;;;;;;;;;
	cmp eax, ecx
	jge .num1_zero
	cmp eax, edx
	jge .num2_zero
	jmp .not_zero
.num1_zero:
	mov ecx, 0
	mov edx, [edi + 4*eax]	; array2[len - i - 1]
	jmp .end_zero
.num2_zero:
	mov ecx, [esi + 4*eax]	; array1[len - i - 1]
	mov edx, 0
	jmp .end_zero
.not_zero:
	mov ecx, [esi + 4*eax]	; array1[len - i - 1]
	mov edx, [edi + 4*eax]	; array2[len - i - 1]
.end_zero:

;;;;;;;;;;;;;;;;;
	add ecx, edx	; ecx = arr[len - i - 1] + arr[len - i - 1]
	add ecx, [perenos]

	mov esi, eax	; esi = i
	mov eax, ecx	; eax = ecx
	cdq
	idiv dword [ebp + 28]

	mov [perenos], eax
	mov [ebx + 4*esi], edx	; array_sum[i] = array1[i*] + array2[i*]
	
;;;;;;;;;;;;;;;;;
	pop edi
	pop esi
	pop edx
	pop ecx
	pop eax
	inc eax
	jmp lp
lpq:
	mov ecx, [perenos]
	cmp ecx, 1
	jnge .last_perenos
	mov [ebx + 4*eax], ecx
	add eax, 1
.last_perenos:
	
	pop ebx
	pop edi
	pop esi
	pop ebp
	ret


