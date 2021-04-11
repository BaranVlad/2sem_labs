global solve_asm

section .text

solve_asm:
		push ebp
		mov ebp, esp

		push ebx

		mov ebx, [ebp + 8]	
		mov ecx, 0

lp:		inc ecx
		mul ebx
		jno lp
			
		mov eax, ecx

		pop ebx
		pop ebp
ret			
	
