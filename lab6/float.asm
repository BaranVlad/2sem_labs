; This file contains assembly macroses. 
; It's works like multi-line defines in c++

%macro fld_reg 1
	push %1
	fild dword [esp]
	add esp, 4
%endmacro

%macro fcom_ 1
	fcom %1
	fstsw ax
	sahf
%endmacro

%macro fcomp_ 1
	fcomp %1
	fstsw ax
	sahf
%endmacro

%macro fcompp_ 0
	fcompp
	fstsw ax
	sahf
%endmacro

