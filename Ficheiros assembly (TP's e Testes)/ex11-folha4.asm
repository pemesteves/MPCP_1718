include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data

;; seccao de codigo principal 
.code
ROTINA PROC uses EDI A:DWORD , B: DWORD

RET
ROTINA ENDP

main PROC C
	mov eax, eax
	invoke ROTINA , EAX , EBX
main ENDP
;; -----------------------------
;; codigo de outras rotinas
end 