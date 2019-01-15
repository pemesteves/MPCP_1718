include mpcp.inc
.xmm
;; declaracoes de dados (variaveis globais)
.data
msg BYTE "%f", 13, 10, 0
b REAL8 7.8
m REAL8 3.6
n REAL8 7.1
p REAL8 ?
;; seccao de codigo principal 
.code

main PROC C
		movsd xmm0, b ;B
		movsd xmm1, m ;M
		movsd xmm2, n ;N
		xorpd xmm3, xmm3 ;P=0
		subsd xmm3, xmm1 ;P=-M
		addsd xmm2, xmm0 ; M = N+B
		mulsd xmm3, xmm2
		movsd p, xmm3

		invoke printf, offset msg, p
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas


end 