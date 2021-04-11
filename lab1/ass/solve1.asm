global solve_asm

section .text

solve_asm:
		push ebp
		mov ebp, esp

		mov eax, [ebp + 8]
		mul eax
		mov ecx, eax
		add eax, 1
		mul ecx
		add eax, 1
		mul dword [ebp + 8]		

		pop ebp
ret			
	
