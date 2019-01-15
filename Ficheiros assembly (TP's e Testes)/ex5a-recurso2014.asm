include mpcp.inc
.xmm
;; declaracoes de dados (variaveis globais)
.data
b REAL8 2.0
B REAL8 3.0
h REAL8 2.5

;; seccao de codigo principal 
.code
areaTrap proto L1:real8, L2:real8, H:real8

main PROC C
		invoke areaTrap, b, B, h
		invoke _getch
		invoke	ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas

areaTrap PROC L1:real8, L2:real8, H:real8
	movsd xmm0, L1
	movsd xmm1, L2
	addsd xmm0, xmm1
	mov eax, 2
	cvtsi2sd xmm1, eax
	divsd xmm0, xmm1
	movsd xmm1, H
	mulsd xmm0, xmm1
	ret
areaTrap ENDP

end 