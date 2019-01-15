include mpcp.inc

.data

sequencia DWORD 24,13,2,4,5,7,9,1,3   ; 1,2,3,4,5,7,9,13,24


.code

ordena PROC seq_ptr: ptr dword, nelem: dword


	mov esi, seq_ptr
	dec ecx
	add esi, 4

pre_cicle:
	mov edi,0
	mov ecx, nelem
	mov esi, seq_ptr
cicle:
	jecxz fim
	mov eax, [esi]
	mov ebx, [esi-4]

	cmp ebx, eax
	jg swap

prep_cicle:

	dec ecx
	add esi, 4
	jmp cicle

swap:
	
	mov [esi],ebx
	mov [esi-4],eax
	mov edi, 1
	jmp prep_cicle

fim:
	cmp edi, 0
	jg pre_cicle
	
	ret

ordena endp

main PROC C

	invoke ordena, offset sequencia, lengthof sequencia

	mov esi, offset sequencia
	invoke _getch
	invoke ExitProcess,1

main endp

end