;; Funcao 3 em linguagem assembly
;; Valor de retorno: nenhum
.686
.model flat, C

.code

afunc3 PROC USES edi ebx pixels: ptr byte, largura: sdword, altura:sdword
;; preencher com a funcionalidade pretendida
	mov		eax,largura
	mul		altura		; EAX = número de pixels
	jo		fim			; resultado não cabe em 32 bits
	; EDX = 0 (garantido)
	mov		ecx, eax

	xor eax, eax
	xor edx, edx
	xor ebx, ebx

	mov		edi, pixels

	;;No código seguinte deve-se descomentar e comentar conforme a componente que se quer alterar

	.WHILE (ecx > 0)					;; poderia usar "loop"
		mov al, byte ptr [edi]		;; componente B
		mov bl, byte ptr [edi+1]	;; componente G
		mov dl, byte ptr [edi+2]	;; componente R			
		
		mov		[edi], dl
		mov		[edi+1], al
		mov		[edi+2], bl
		mov     byte ptr [edi+3], 255
		add		edi, 4
		dec		ecx
	.ENDW

fim:
	ret
afunc3 ENDP

END
