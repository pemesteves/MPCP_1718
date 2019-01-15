include mpcp.inc
.xmm

;; declaracoes de dados (variaveis globais)
.data
sequencia REAL4 17.2, 10.0, 3.1, 6.2, 1.0, 2.0, 3.0, 4.0
;; seccao de codigo principal 
.code
mirrorSeq PROTO seq:PTR REAL4, N:DWORD

main PROC C
		invoke mirrorSeq, offset sequencia, lengthof sequencia
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
mirrorSeq PROC seq:PTR REAL4, N:DWORD
	nop
	.WHILE N>0
		movaps xmm1, [seq] 
		shufps xmm1, xmm1, 10110001b
		movaps [seq], xmm1
		add seq, 16
		sub N, 4
	.ENDW
	ret
mirrorSeq ENDP

end 
