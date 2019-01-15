include mpcp.inc
.xmm
;; declaracoes de dados (variaveis globais)
.data
msg BYTE "%f", 13, 10, 0
W SDWORD 7
X REAL8 7.1
Y REAL8 ?
;; seccao de codigo principal 
.code

main PROC C
		CVTSI2SD xmm0, W
		SQRTSD xmm1, X
		ADDSD xmm1, xmm0
		MOVSD Y, xmm1
		invoke printf, offset msg, Y
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas


end 