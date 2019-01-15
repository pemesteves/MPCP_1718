include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
num BYTE 35
msg BYTE "%d", 13, 10, 0
;; seccao de codigo principal 
.code
primo PROC C n:DWORD
		mov ebx, n
		sar ebx, 1
		mov ecx, 2
ciclo:	.if ecx > ebx
			mov eax, 0
			jmp fim
		.elseif ecx == ebx
			mov eax, n
			div ecx
			mov eax, edx
			jmp fim
		.else
			mov eax, n
			div ecx
			.if edx == 0
				mov eax, edx
				jmp fim
			.else
				inc ecx
				jmp ciclo
			.endif
		.endif
fim:	ret
primo ENDP

main PROC C
	invoke primo, num
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas

end 