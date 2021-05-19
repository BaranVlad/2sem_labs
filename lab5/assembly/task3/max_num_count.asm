global max_num_count

section .text

; inc ecx if al digit, else ecx = 0
%macro is_digit_al 0
	cmp al, '0'
	jl %%false
	cmp al, '9'
	jg %%false
%%true:
	inc ecx
	jmp %%end
%%false:
	mov ecx, 0
%%end:
%endmacro

; compare ecx and edx, if ecx > edx then edx = ecx
%macro check_max 0
	cmp ecx, edx
	jng %%exit
	mov edx, ecx
%%exit:
%endmacro

max_num_count:
	push ebp
	mov ebp, esp
	push esi

	mov esi, [ebp + 8]
	xor ecx, ecx
	xor edx, edx
.lp:
	cmp byte [esi], 0
	je .lp_q
	lodsb 				; [esi] -> al, inc esi
	is_digit_al
	check_max	

	jmp .lp
.lp_q:
	mov eax, edx

	pop esi
	pop ebp
	ret

