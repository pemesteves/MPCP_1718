include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
dwordarray SDWORD 1, -1, 32767, -32768, 32770, -32999 
wordarray SWORD LENGTHOF dwordarray dup(0)
;; seccao de codigo principal 
.code

main PROC C
	   			mov ecx, lengthof dwordarray
				mov edi, offset dwordarray
		 		mov esi, offset wordarray
ciclo:			move al, [edi]
				cmp edi, 7fffh
				jnle alternativa1
				cmp edi, 8000h
				jnge alternativa2
				mov [edi], [esi]
				jmp fim_ciclo
alternativa1:	mov [esi], 7fffh
				jmp fim_ciclo

fim_ciclo:		add edi, type dwordarray
				add esi, type wordarray

				invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas


end 