org 100h

setup:
	mov AH, 00h
	mov AL, 0Eh
	int 10h			;włączenie trybu graficznego
	mov AX, 0001h	;
	int 33h			;włączenie kursora


main_loop:
	mov AX, 0003h	;
	int 33h			;
	cmp BX, 1
	
	je draw_pixel
		retutn:
	
	mov AH, 01h
	int 16h 	;odczytujemy wejście z klawiatury
	cmp AL, 'q'
	je koniec 	;weryfikacja zakończenia programu
jmp main_loop
	
koniec:
	mov AH, 00h
	mov AL, 02h
	int 10h
	mov AX, 4C00h
	int 21h
	
draw_pixel:
	mov AH, 0Ch		;
	mov AL, 2h  	; kolory rgb 4 2 1
	int 10h			;odczyt kursora i wydruk piksela
	
	dec DX
	int 10h
	add DX, 2
	int 10h
	dec DX 
	dec CX
	int 10h
	add CX, 2
	int 10h
	
	
	
	jmp main_loop