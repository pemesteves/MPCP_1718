include mpcp.inc

.data
	val sdword -6
	msg BYTE "%d", 13, 10, 0

.code
main PROC C
	mov eax , -1
	mov ebx , 5
	.IF sdword ptr eax > ebx
		add eax , ebx
	.ELSEIF eax > val
		sub eax , ebx
	.ENDIF

	invoke printf, offset msg, eax
	invoke _getch
	invoke ExitProcess, 0
main ENDP

end