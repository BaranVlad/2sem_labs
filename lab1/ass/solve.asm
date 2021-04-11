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
		
		mov ecx, [ebp + 16]
		mov [ecx], eax
		
		mov ecx, [ebp + 20]
		mov [ecx], edx

		pop ebp
ret

