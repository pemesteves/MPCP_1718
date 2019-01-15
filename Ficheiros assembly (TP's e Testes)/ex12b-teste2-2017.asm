include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
seq1 WORD 0, 0, 0, 0, 3, 7, 7, 8
seq2 WORD 1, 3, 5, 6, 7, 8, 8, 9
msg BYTE "%d"
;; seccao de codigo principal 
.code

coerente PROTO tin:PTR WORD, tout: PTR WORD, N: DWORD

main PROC C
	invoke coerente, OFFSET seq1, OFFSET seq2, LENGTHOF seq1
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
coerente PROC USES esi edi tin: PTR WORD, tout: PTR WORD, N: DWORD
				LOCAL viaturasCertas: DWORD
				mov edi, tin
				mov esi, tout
				xor edx, edx
				xor eax, eax
				mov viaturasCertas, 0
ciclo:			.IF N==0
					jmp fimRotina
				.ENDIF
				mov ax, [edi]
				mov dx, [esi]
				.IF ax > dx
					mov viaturasCertas, 1
					jmp fimRotina
				.ENDIF
				add edi, 2
				add esi, 2
				dec N
				jmp ciclo
fimRotina:		mov eax, viaturasCertas
				ret
coerente ENDP
end 