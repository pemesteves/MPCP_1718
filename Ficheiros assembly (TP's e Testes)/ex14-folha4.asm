include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
valores dword 4, 8, 11, 2, 9, 7
msg BYTE "Max = %d", 13,10 ,0
;; seccao de codigo principal 
.code
maxnum PROC uses edi edx ecx SEQ: PTR DWORD, N:DWORD
		.if N == 1
			mov edi, SEQ
			mov eax, [edi]
			jmp fim
		.else
			mov edx, N
			dec edx
			invoke maxnum, SEQ, edx
			sal edx, 2
			mov ecx, SEQ
			add edx, ecx
			mov ebx, [edx]
			.if  eax > ebx
				jmp fim
			.else
				mov eax, ebx
			.endif
		.endif
fim:	ret
		
maxnum ENDP

main PROC C
	invoke maxnum , offset valores , lengthof valores
	invoke printf, offset msg, eax
	invoke _getch
	invoke ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
end 