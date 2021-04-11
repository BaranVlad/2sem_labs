global is_polindrome

section .text

is_polindrome:
	push ebp
	mov ebp, esp
	push esi
	push edi

	mov esi, [ebp + 8]  ; esi = str
	xor eax, eax

	mov edi, esi	    ; edi = esi = str
.loop_len: 
	cmp byte [edi], 0	
	je .loop_len_quit
	inc edi

	jmp .loop_len
.loop_len_quit:			; edi = str + strlen(edi)
	
	dec edi				; edi = str + strlen(edi) - 1 
.loop_polindrome:
	mov dl, [esi]
	cmp dl, [edi]
	jne is_polindrome_q
	cmp esi, edi
	jge .equal_quit

	inc esi
	dec edi
 	
	jmp .loop_polindrome
.equal_quit:
	mov eax, 1	
	
is_polindrome_q:
	pop edi
	pop esi
	pop ebp
	ret

