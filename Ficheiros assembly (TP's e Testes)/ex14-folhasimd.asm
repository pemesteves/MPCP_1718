include mpcp.inc
.xmm

;; declaracoes de dados (variaveis globais)
.data
sequencia REAL4 17.2, 10.0, 3.1, 6.2, 1.0, 2.0, 3.0, 4.0
;; seccao de codigo principal 
.code
scaleSeq PROTO seq:PTR REAL4, N:DWORD, alfa:REAL4

main PROC C
		invoke scaleSeq, offset sequencia, lengthof sequencia, 3
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
scaleSeq PROC seq:PTR REAL4, n:DWORD, alfa:REAL4
	movss xmm2, alfa
	shufps xmm2, xmm2, 00000000b		
	.WHILE n>0
		movaps xmm1, [seq] 
		mulps xmm1, xmm2
		movaps [seq], xmm1

		add seq, 16
		sub n, 4
	.ENDW
	ret
scaleSeq ENDP

end 
