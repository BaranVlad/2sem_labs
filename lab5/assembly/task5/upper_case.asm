global upper_case

section .text

%define dist -32

%macro is_alpha 0		; check is al characheter and if it is then upper al
	cmp al, 'a'
	jl %%end
	
	cmp al, 'z'
	jg %%end

	add al, dist
%%end:
%endmacro

upper_case:
	push ebp
	mov ebp, esp
	push esi

	mov esi, [ebp + 8]

	cmp byte [esi], 0
	je upper_case_q
	
	mov al, byte [esi]
	is_alpha
	mov byte [esi], al

	inc esi
.lp:
	cmp byte [esi], 0
	je .lp_q

	cmp byte [esi - 1], ' '
	jne .not_first_letter
	
	mov al, byte [esi]
	is_alpha
	mov byte [esi], al
		
.not_first_letter:
	inc esi
	jmp .lp
.lp_q:
upper_case_q:
	pop esi
	pop ebp
	ret

