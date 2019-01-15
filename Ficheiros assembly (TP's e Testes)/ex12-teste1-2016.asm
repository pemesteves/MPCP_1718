include mpcp.inc

.data
seq SDWORD 15, -19, 8, 71, 100, 20, 41, -11, -20, -54
limiar SDWORD 20
formato BYTE "Alterados %d elementos.", 13, 10, 0
.code

main PROC C
			xor eax, eax
			mov edi, OFFSET seq
			mov ecx, LENGTHOF seq
			mov ebx, limiar
ciclo:		.IF SDWORD PTR [edi] > ebx
				mov [edi], ebx
				inc eax
				jmp fimCiclo
			.ENDIF
			neg ebx
			.IF SDWORD PTR [edi] < ebx
				inc eax
				mov [edi], ebx
			.ENDIF
			neg ebx
fimCiclo:	add edi, 4
			loop ciclo
			invoke printf, offset formato, eax
			invoke _getch
			invoke ExitProcess,0
main ENDP
end