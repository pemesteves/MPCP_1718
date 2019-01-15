include mpcp.inc
.xmm

;; declaracoes de dados (variaveis globais)
.data
;; seccao de codigo principal 

.code

main PROC C
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas


end 
