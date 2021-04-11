global sort_sentence

section .bss
strs resd 60			; array of a pointer to first character of word

section .text

sort_sentence:
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ebx

	mov esi, [ebp + 8]
	mov edi, [ebp + 12]

;;; build strs
	mov ecx, esi
	mov [strs], ecx
	mov eax, 1
.lp:
	cmp byte [ecx], 32
	je .write
	cmp byte [ecx], 0
	je .lp_q
	
	jmp .end_write
.write:
	mov [strs + eax * 4], ecx
	inc dword [strs + eax * 4]
	inc eax
.end_write:
	inc ecx

	jmp .lp
.lp_q: 						
							; eax - length of strs array

;;; sorting strs
	push esi
	push edi

	mov edx, eax
	mov ecx, 0
.lp1:
	cmp ecx, edx
	jge .lp1_q
	mov esi, [strs + 4*ecx]
	
	;;; 
	mov ebx, ecx
	inc ebx
.lp2:
	cmp ebx, edx
	jge .lp2_q
	mov edi, [strs + 4*ebx]

	;;; cmp loop
.lp3:
	mov al, [esi]
	cmp al, [edi]
	jg .lp3_swap_q
	cmp al, [edi]
	jl .lp3_q

	cmp al, 0
	je .lp3_q
	cmp al, 32
	je .lp3_q

	inc esi
	inc edi
	jmp .lp3
.lp3_swap_q:
	mov eax, [strs + 4*ecx]
	xchg eax, [strs + 4*ebx]
	mov [strs + 4*ecx], eax
	mov esi, eax
.lp3_q:
	;;; cmp loop end
	
	inc ebx
	jmp .lp2
.lp2_q:	
	;;;
	
	inc ecx
	jmp .lp1
.lp1_q:
	pop edi
	pop esi

	;;; write answer to new string
	push esi

	xor ecx, ecx
.lp_answer:
	cmp ecx, edx
	jge .lp_answer_q
	mov esi, [strs + 4*ecx]	
	
.lp_writing:
	cmp byte [esi], 0
	je .lp_writing_q
	cmp byte [esi], 32
	je .lp_writing_q
	movsb

	jmp .lp_writing
.lp_writing_q:
	mov byte [edi], 32
	inc edi

	inc ecx
	jmp .lp_answer
.lp_answer_q:
	mov byte [edi - 1], 0
	pop esi


sort_sentence_q:
	pop ebx
	pop edi
	pop esi
	pop ebp	
	ret 

