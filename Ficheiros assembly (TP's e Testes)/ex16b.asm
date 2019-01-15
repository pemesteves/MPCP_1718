include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
;; seccao de codigo principal 
.code
main PROC C
		xor ax, ax
		xor bx, bx
		xor ecx, ecx

		cmp ah, cl
		jnb fim
		cmp al, ah
		ja e
		cmp bl, bh
		jna fim
e:		dec ecx
fim:
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
end