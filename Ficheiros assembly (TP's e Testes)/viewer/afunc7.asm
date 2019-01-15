;; Funcao 7 em linguagem assembly
;; Valor de retorno: nenhum
.686
.model flat, C

.data
	quatro DWORD 4

.code

afunc7 PROC uses edi esi pixels: ptr byte, largura: sdword, altura:sdword
    ;; preencher com a funcionalidade pretendida
	;; preencher com a funcionalidade pretendida	
	
	xor ecx, ecx
		mov esi, pixels
		.WHILE ecx < altura
			mov edi, largura		;nº pixels/largura
			shl edi, 2				;4 * nº pixels/largura
			add edi, esi			;end da linha seguinte
			push edi				;... é guardado na pilha
			sub edi, 4				;end do ultimo pixel da linha atual
			.WHILE esi < edi
				mov eax, [esi]
				mov ebx, [edi]
				mov [edi], eax
				mov [esi], ebx
				add esi, 4
				add edi, -4
			.ENDW
			pop esi
			inc ecx
		.ENDW

	ret
afunc7 ENDP

END