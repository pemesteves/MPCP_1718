include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
seq BYTE "({[adadfsa]})", 13, 10, 0
;; seccao de codigo principal 
.code
main PROC C
					mov eax, lengthof seq
					mov edi, offset seq
					mov bl, 0  ;;flag que verifica se já existe algo na stack
ciclo:				cmp [edi], 40
					je poe_na_pilha
					cmp [edi], 91
					je poe_na_pilha
					cmp [edi], 123
					jne nao_poe_na_pilha
poe_na_pilha:

nao_poe_na_pilha:
main ENDP
;; -----------------------------
;; codigo de outras rotinas
end 