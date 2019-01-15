include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
val1 WORD 4
val2 WORD 3
total BYTE "Total = %d", 13, 10, 0
;; seccao de codigo principal 
.code
main PROC C
		xor eax, eax
		mov ax, val1
		mul val2
		shl edx, 16
		or eax, edx

		invoke printf, offset total, eax
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
end 
