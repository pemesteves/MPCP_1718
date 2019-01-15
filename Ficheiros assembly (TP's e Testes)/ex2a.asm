include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
bytearray SBYTE 10 DUP(1)
wordarray SWORD 10 DUP(0)
;; seccao de codigo principal 
.code

main PROC C
		mov ecx, LENGTHOF bytearray
		mov edi, offset bytearray
		mov esi, offset wordarray
ciclo:	mov al, [edi]
		cbw
		mov [esi], ax
		add edi, type bytearray
		add esi, type wordarray
		LOOP ciclo

		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas


end 