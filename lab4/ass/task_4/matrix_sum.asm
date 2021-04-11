global matrix_sum

section .text

; [ebp + 20] - n
; [ebp + 24] - m
matrix_sum:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx

	;;; ebx = i_count * 4
	mov eax, [ebp + 28]
	mov ecx, 4
	mul ecx
	mov ebx, eax 
	;;;

	mov esi, [ebp + 8]	; esi = matrix1
	mov edx, [ebp + 12] ; edx = matrix2
	mov edi, [ebp + 16] ; edi = result
	
	xor ecx, ecx
.lp1:
	cmp ecx, [ebp + 20]	; while (i < n) 
	jge .lp1q
	push ecx

	xor ecx, ecx
	push esi
	push edx
	push edi
.lp2:
	cmp ecx, [ebp + 24] ; while (i < m)
	jge .lp2q
	
	;;; result = matrix1 + matrix2
	mov eax, [esi]
	add eax, [edx] 
	mov [edi], eax	
	;;;
	
	inc ecx
	add edx, 4			; get next element of matrix2
	add esi, 4
	add edi, 4
	jmp .lp2
.lp2q:
	pop edi
	pop edx
	pop esi

	pop ecx
	inc ecx
	add esi, ebx		; adding array string count to array address
	add edx, ebx		; now array address point to the next string
	add edi, ebx		;
	jmp .lp1
.lp1q:
	

matrix_sum_q:
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret

