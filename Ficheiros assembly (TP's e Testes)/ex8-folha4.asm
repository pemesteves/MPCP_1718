include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
msg BYTE "%d"
;; seccao de codigo principal 
.code

minPot2 PROC USES ebx val: DWORD
		LOCAL num2: DWORD
			mov eax, val
			mov num2, 2
ciclo:		xor edx, edx 
			mov ecx, eax
			inc eax
			inc ecx
			div num2
			.IF edx != 0
				mov eax, ecx
				jmp ciclo
			.ELSE
				mov eax, ecx
				xor ebx, ebx
Shift:			shr ecx, 1
				jnc Shift
				.IF ecx == 0
					jmp fimRotina
				.ELSE
					jmp ciclo		
				.ENDIF
			.ENDIF
fimRotina:	ret
minPot2 ENDP

main PROC C
	invoke minPot2, 63
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
END