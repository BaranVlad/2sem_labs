global del_symbols

;;; del_one_symbol(char* str)
del_one_symbol:
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ebx
	
	mov esi, [ebp + 8]
	cmp byte [esi], 0		; if string is empty then exit
	je del_one_symbol_q
	
.lp:
	inc esi

	mov bl, [esi]
	mov [esi - 1], bl

	cmp byte [esi], 0
	jne .lp

del_one_symbol_q:
	pop ebx
	pop edi
	pop esi
	pop ebp
	ret

;;; void del_symbols(char* str, char sym)
del_symbols:
	push ebp
	mov ebp, esp
	
	mov edx, [ebp + 8]
	mov eax, [ebp + 12]
	
.lp:
	cmp byte [edx], 0
	je .lp_q
	
	cmp al, [edx]
	jne .not_equal
	
	push edx
	call del_one_symbol
	add esp, 4				; clear stack
	
	jmp .equal
.not_equal:
	inc edx
.equal:
	jmp .lp
.lp_q:
	
del_symbols_q:
	pop ebp
	ret

