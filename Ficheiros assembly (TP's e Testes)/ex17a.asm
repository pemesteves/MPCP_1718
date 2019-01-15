include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
seq DWORD 1, 2, 3, 4, 5, 6
msg BYTE "Media = %d", 13, 10, 0
;; seccao de codigo principal 
.code
main PROC C
		xor eax, eax
		mov edi,OFFSET seq
		mov ecx,LENGTHOF seq
		mov ebx, ecx
ciclo:	add eax, DWORD PTR [edi]
		add edi, 4
		dec ecx
		jnz ciclo

		div ebx
		
		shl edx, 2
		cmp edx, ebx
		jna fim
		inc eax
fim:
		invoke printf, offset msg, eax
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
end