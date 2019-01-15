include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
;; seccao de codigo principal 
.code
recinv PROC USES edi esi SEQ: PTR SDWORD, N: DWORD
			mov edi, SEQ
			mov esi, edi
			dec N
			mov eax, N
			sal eax, 2
			add esi, eax
			.WHILE edi < esi
				mov eax, [edi]
				mov edi, [esi]
				mov esi, eax
				add edi, 4
				sub esi, 4
			.ENDW
			ret
recinv ENDP

main PROC C
		
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas


end 