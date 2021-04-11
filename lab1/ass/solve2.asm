global solve_asm

section .text

solve_asm:
		push ebp
		mov ebp, esp

		push ebx

		mov ebx, [ebp + 8]
		mov eax, ebx
		imul ebx
		imul ebx			
		mov ecx, eax
		; edx = a, ecx = a^3, eax = a^3
		add eax, 2
		imul ebx
		add eax, 1
		imul ebx
		sub eax, 8
		cdq
		idiv ecx	

		pop ebx

		pop ebp
ret			

