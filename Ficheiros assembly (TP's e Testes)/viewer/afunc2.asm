;; Funcao 2 em linguagem assembly
;; Valor de retorno: nenhum
.686
.model flat, C

.code

afunc2 PROC USES edi pixels: ptr byte, largura: sdword, altura:sdword
;; preencher com a funcionalidade pretendida
	mov		eax,largura
	mul		altura		; EAX = número de pixels
	jo		fim			; resultado não cabe em 32 bits
	; EDX = 0 (garantido)
	mov		ecx, eax

	xor eax, eax

	mov		edi, pixels

	;;No código seguinte deve-se descomentar e comentar conforme a componente que se quer alterar

	.WHILE (ecx > 0)					;; poderia usar "loop"
		;;mov byte ptr [edi], al		;; componente B
		;;mov byte ptr [edi+1], al	;; componente G
		mov byte ptr [edi+2], al	;; componente R			
		
		;;mov		[edi], al
		;;mov		[edi+1], al
		mov		[edi+2], al
		mov     byte ptr [edi+3], 255
		add		edi, 4
		dec		ecx
	.ENDW

fim:
	ret
afunc2 ENDP

END
