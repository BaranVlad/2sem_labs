global solve1

section .text

solve1:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]
	mov ecx, [ebp + 12]
	xor edx, edx
	
	sub ecx, 1
lp: 
	cmp ecx, 0
	jl lpq		

	add edx, [eax + 4 * ecx]

	dec ecx
	jmp lp
lpq:
	mov eax, edx

	pop ebp
	ret

