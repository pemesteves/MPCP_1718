include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
;; seccao de codigo principal 
.code
main PROC C
		xor ax, ax
		xor bx, bx
		xor ecx, ecx

		cmp al, ah
		jna ou
		cmp bl, bh
		ja fim
ou:		cmp ah, cl
		jnb fim
		inc ecx
fim:
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
end