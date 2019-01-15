include mpcp.inc
.xmm
;; declaracoes de dados (variaveis globais)
.data
X REAL4 2.5, 1.2, -5.3, -3.2
Y REAL4 1.3, 5.4, 3.2, -8.6
result REAL4 ?
msg BYTE "%fl", 13, 10, 0
;; seccao de codigo principal 
.code
prodint PROTO vectX:PTR REAL4, vectY:PTR REAL4, N:dword, res:PTR REAL4

main PROC C
		invoke prodint, offset X, offset Y, lengthof X, offset result
		invoke  printf, offset msg, result
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
prodint PROC vectX: PTR REAL4, vectY: PTR REAL4, N:dword, res: PTR REAL4
		xorps xmm2, xmm2
ciclo:	xorps xmm7, xmm7
		movss xmm7, real4 ptr [vectX]
		mulss xmm7, real4 ptr [vectY]
		addss xmm2, xmm7
		addss vectX, 4.0
		addss vectY, 4.0
		dec N
		.IF N != 0
			jmp ciclo
		.ENDIF
		movss res, xmm2
		ret
prodint ENDP
end 