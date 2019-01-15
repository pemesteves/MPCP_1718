;; Funcao 6 em linguagem assembly
;; Valor de retorno: nenhum
.686
.model flat, C

.data
	linha DWORD 1
	coluna DWORD 1
	val3 DWORD 3
	pos DWORD ?
.code

afunc6 PROC USES edi ebx pixels: ptr byte, largura: sdword, altura:sdword
    ;; preencher com a funcionalidade pretendida
	mov		eax,largura
	mul		altura		; EAX = número de pixels
	jo		fim			; resultado não cabe em 32 bits
	; EDX = 0 (garantido)
	mov		ecx, eax

	mov		edi, pixels

	.WHILE (ecx > 0)					;; poderia usar "loop"
		mov pos, edi
		push ecx
		mov ecx, largura
		xor edx, edx
		push edx
		.WHILE (ecx > 0)
			;;Média dos componentes
			movzx	eax, byte ptr [edi]		;; componente B
			movzx	ebx, byte ptr [edi+1]	;; componente G
			add		eax, ebx
			movzx	ebx, byte ptr [edi+2]	;; componente R
			add		eax, ebx
			xor		edx, edx				
			div		val3
			;;

			pop edx
			.IF (eax > edx)
				mov edx, eax
				mov pos, edi
			.ENDIF
			push edx
			dec ecx
			add edi, 4
		.ENDW
		pop edx
		mov edx, pos
		mov byte ptr [edx], 0
		mov byte ptr [edx+1], 0
		mov byte ptr [edx+2], 255 

		pop ecx
		sub ecx, largura
	.ENDW

fim:
	ret
afunc6 ENDP

END