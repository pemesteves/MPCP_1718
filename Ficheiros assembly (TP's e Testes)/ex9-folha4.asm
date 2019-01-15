include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
seq SWORD 1, 2, 3
msg BYTE "%d", 13, 10, 0
;; seccao de codigo principal 
.code

poly2 PROTO coefs:PTR SWORD, x:SWORD

main PROC C
	invoke poly2, OFFSET seq, 2
	invoke printf, OFFSET msg, eax
	invoke _getch
	invoke ExitProcess, 0
main ENDP
;; -----------------------------
;; codigo de outras rotinas

poly2 PROC USES ebx esi coefs:PTR SWORD, x:SWORD
			xor eax, eax
			xor edx, edx		
			xor ebx, ebx
			mov esi, coefs

			mov ax, x	
			imul x 
			mov bx,[esi]		
			imul bx		
			push eax		
			mov ax, x		
			mov bx,[esi+2]	
			imul bx			
			pop edx
			add ax, dx	
			add ax, [esi+4]
	
			ret
poly2 ENDP

end 