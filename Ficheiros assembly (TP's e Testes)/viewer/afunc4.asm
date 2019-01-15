;; Funcao 4 em linguagem assembly
;; Valor de retorno: nenhum
.686
.model flat, C

.data
	val BYTE 10

.code

afunc4 PROC pixels: ptr byte, largura: sdword, altura:sdword
    ;; preencher com a funcionalidade pretendida
	mov		eax,largura
	mul		altura		; EAX = número de pixels
	jo		fim			; resultado não cabe em 32 bits
	; EDX = 0 (garantido)
	mov		ecx, eax

	mov		edi, pixels

	xor eax, eax

	mov al, val

	;;No código seguinte deve-se descomentar e comentar conforme a componente que se quer alterar

	.WHILE (ecx > 0)					;; poderia usar "loop"
		add byte ptr [edi], al		;; componente B
		jnc bNMax
		mov byte ptr [edi], 255
bNMAX:
		add byte ptr [edi+1], al	;; componente G
		jnc gNMAX
		mov byte ptr [edi+1], 255
gNMAX:
		add byte ptr [edi+2], al	;; componente R			
		jnc rNMAX
		mov byte ptr [edi+2], 255
rNMAX:
		
		mov     byte ptr [edi+3], 255
		add		edi, 4
		dec		ecx
	.ENDW

fim:
	ret
afunc4 ENDP

END