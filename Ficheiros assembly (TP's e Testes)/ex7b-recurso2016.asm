include mpcp.inc
;; declaracoes de dados (variaveis globais)
.data
seq DWORD 2, 4, 5, 7, 10, 13, 0
val DWORD 2
msg BYTE "%d", 13, 10, 0
;; seccao de codigo principal 
.code
multn PROTO n:dword, ptseq:ptr dword

main PROC C
		invoke multn, val, offset seq
		invoke printf, offset msg, eax
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas
multn PROC uses edi ebx n:dword, ptseq:ptr dword
	mov edi, ptseq
	mov ecx, n
	xor ebx, ebx
	.WHILE (dword ptr [edi] != 0)
		xor edx, edx
		mov eax, [edi]
		div ecx
		.IF (edx != 0)
			inc ebx
		.ENDIF
		add edi, 4
	.ENDW
	mov eax, ebx
	ret
multn ENDP
end 