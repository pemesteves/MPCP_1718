include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
seqr SWORD 2, 3, 5, 8, 31, 23, 43, 12, 5, 1, 0, 2, 3
msg BYTE "%d", 13, 10, 0
;; seccao de codigo principal 
.code
LIM PROTO lim:SWORD, seq: PTR WORD, N: WORD

main PROC C
		invoke LIM, 10, offset seqr, lengthof seqr	
		invoke printf, offset msg, eax
		invoke _getch
		invoke ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas

LIM PROC USES edi lim:SWORD, seq: PTR WORD, N: WORD
			mov cx, N
			mov edi, seq
			mov dx, lim
			xor eax, eax
			.WHILE cx >0
				.IF dx < [edi]
					inc eax
				.ENDIF
				add edi, 2
				dec cx
			.ENDW
			ret
LIM ENDP
end 