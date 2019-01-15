include mpcp.inc
.xmm
;; declaracoes de dados (variaveis globais)
.data
msg BYTE "%f", 13, 10, 0
perguntaRaio BYTE "RAIO ? ",13, 10,  0
raioScan BYTE "%lf", 0
AREA REAL8 ?
PI REAL8 3.1415926535897932
RAIO REAL8 ?
;; seccao de codigo principal 
.code

main PROC C
		invoke printf, offset perguntaRaio
		invoke scanf, offset raioScan, offset RAIO
		movsd xmm0, RAIO
		mulsd xmm0, RAIO
		mulsd xmm0, PI
		movsd AREA, xmm0
		invoke printf, offset msg, AREA
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas


end 