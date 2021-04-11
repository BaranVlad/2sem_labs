global solve_asm

section .text

solve_asm:
		push ebp
		mov ebp, esp
		
		mov ecx, [ebp + 8]
		mov eax, [ecx]
		mov edx, [ecx + 4]

		mov ecx, [ebp + 12] 
		idiv dword [ecx]

		pop ebp
ret

