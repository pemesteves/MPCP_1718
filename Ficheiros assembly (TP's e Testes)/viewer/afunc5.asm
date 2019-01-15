;; Funcao 5 em linguagem assembly
;; Valor de retorno: nenhum
.686
.model flat, C

.data
	linha DWORD 20
	coluna DWORD 20

.code

afunc5 PROC USES edi pixels: ptr byte, largura: sdword, altura:sdword
    ;; preencher com a funcionalidade pretendido

	mov eax, linha
	sub eax, 1
	mul largura
	add eax, coluna

	mov	edi, pixels
	
	sal eax, 2

	add edi, eax

	mov byte ptr [edi], 0
	mov byte ptr [edi+1], 0
	mov byte ptr [edi+2], 255

fim:
	ret
afunc5 ENDP

END