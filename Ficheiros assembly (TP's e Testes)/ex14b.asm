include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
val DWORD 4
msg BYTE "Total = %d", 13, 10, 0
;; seccao de codigo principal 
.code
main PROC C
		xor eax, eax
		xor ebx, ebx
		mov eax, val
		mov ebx, val
		shl eax, 4
		shl ebx, 1
		add eax, ebx

		invoke printf, offset msg, eax
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
end 