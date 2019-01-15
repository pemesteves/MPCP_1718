include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
seq BYTE "ABCDE"
msg BYTE "%c", 13, 10, 0
;; seccao de codigo principal 
.code
main PROC C
				xor eax, eax
				mov ebx, lengthof seq
				mov edi, offset seq
ciclo:			cmp ebx, 0
				je fim
				mov eax, [edi]
				push eax
				inc edi	
				dec	ebx
				jmp ciclo
fim:			mov ebx, lengthof seq
				xor eax, eax 
novo_ciclo:		cmp ebx, 0
				je fim_programa
				pop eax
				invoke printf, offset msg, eax
				dec ebx
				jmp novo_ciclo
fim_programa:	invoke _getch
				invoke ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
end 