include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
val DWORD 4
msg BYTE "Total = %d", 13, 10, 0
;; seccao de codigo principal 
.code
main PROC C
		xor eax, eax
		mov eax, val
		mov ebx, 18
		mul ebx

		invoke printf, offset msg, eax
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
end 