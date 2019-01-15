include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
STRING BYTE "TEXTO TEXTO",0
MSG BYTE "Total = %d", 13, 10, 0

;; seccao de codigo principal 
.code

main PROC C
		xor eax, eax
		mov edi, offset STRING
ciclo:	mov bl, [edi]
		cmp bl, 0
		jz fim
		inc eax
		add edi, type STRING
		jmp ciclo
fim:	invoke printf, offset MSG, eax
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
end 
