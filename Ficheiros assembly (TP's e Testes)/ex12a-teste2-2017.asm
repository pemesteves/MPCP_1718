include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
seq1 WORD 0, 0, 0, 0, 3, 7, 7, 8
seq2 WORD 1, 3, 5, 6, 7, 8, 8, 9
msg BYTE "%d"
;; seccao de codigo principal 
.code

nviaturas PROTO tin:PTR WORD, tout: PTR WORD, N: WORD, M:WORD

main PROC C
	invoke nviaturas, OFFSET seq1, OFFSET seq2, LENGTHOF seq1, 4
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
nviaturas PROC USES edi ebx tin:PTR WORD, tout: PTR WORD, N: WORD, M:WORD
				mov edi, tin
				mov cx, N
				xor eax, eax
entradaViat:	mov bx, [edi]
				.IF bx < M
					inc eax
				.ELSE
					jmp fimEntViat
				.ENDIF
				add edi, 2
				dec cx
				.IF cx != 0
					jmp entradaViat
				.ENDIF
fimEntViat:		mov cx, N
				mov edi, tout
saidaViat:		mov bx, [edi]
				.IF bx < M
					dec eax
				.ELSE
					jmp fimRotina
				.ENDIF
				add edi, 2
				dec cx
				.IF cx != 0
					jmp saidaViat
				.ENDIF
fimRotina:		ret
nviaturas ENDP
end 