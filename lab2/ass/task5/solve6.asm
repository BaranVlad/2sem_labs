global solve6

section .text
solve6:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 8]
	idiv dword [ebp + 12]

	cmp edx, 0
	jne .call		
	cmp eax, 0
	jne .call

	add eax, edx
	jmp solve6q

.call:
	push edx
	push eax
	call solve6
	add esp, 8	
	
solve6q:
	pop ebp
	ret

