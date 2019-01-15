include mpcp.inc

.data
val DWORD 5
seq DWORD 3, 40, 15, 8, 1, 13, 5, 17, 21
fmt BYTE "A sequencia tem %d multiplos de 5.", 13, 10, "Adeusinho.", 13, 10, 0
.code

main PROC C
			mov esi, offset seq ; apontar para primeiro elemento
			mov ecx, lengthof seq ; número de elementos
			xor ebx, ebx
ciclo:		xor edx, edx
			mov eax, [esi]
			div val
			.IF edx == 0
				inc ebx
			.ENDIF
			add esi, 4
			loop ciclo
			invoke printf, offset fmt, ebx
			invoke _getch
			invoke ExitProcess,0
main ENDP
end