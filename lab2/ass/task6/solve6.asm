global solve6

section .text
solve6:
	push ebp
	mov ebp, esp
	push ebx
	
	mov eax, [ebp + 8]
	mov ebx, [ebp + 12]
	cdq
	idiv ebx

	cmp edx, 0
	je .q		
	cmp ebx, 0
	je .q
	jmp .call
.q:
	mov eax, ebx
	add eax, edx
	jmp solve6q

.call:
	push edx
	push ebx
	call solve6
	add esp, 8	
	
solve6q:
	pop ebx
	pop ebp
	ret

