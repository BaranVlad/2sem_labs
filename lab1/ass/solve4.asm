global solve_asm

section .text

solve_asm:
		push ebp
		mov ebp, esp

		push ebx
		push edi
		push esi

		mov ebx, [ebp + 8]
		mov edx, [ebp + 12]
		
		mov ecx, 0
		
		xor si, si	
lp:		xor di, di	
		mov ax, word [ebx + ecx * 2]
		add ax, si
		adc di, 0
		add ax, word [edx + ecx * 2]
		adc di, 0
		mov si, di	

lp_end:	mov edi, [ebp + 16]
		mov word [edi + ecx * 2], ax

		inc ecx
		cmp ecx, 3
		jb lp	

		pop esi
		pop edi
		pop ebx

		pop ebp
ret			
	
