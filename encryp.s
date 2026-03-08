.global _start
_start:
	
	// read byte in memory
	LDR R0,=VAL
	MOV R8, #4
LOOP:	
		CMP R8, #0
		BEQ END
		// LDRB
		LDRB R1, [R0]	//	8 bit calıscaz
		// MANTIK : A[LSB] = MSB 
		MOV R2, #1			//	R2 --> ....0001
		LSL R2, R2, #7		//	R2 --> ...10000000 8.bit yaptım
		
		AND R2, R1, R2		//	R1 in 8 bitini R2 ye koyuyorum
		LSR R2, R2, #7		//	R2 yi --> (R1'IN 8.BITI)0000000
							//	R2 Yİ -->  0000000(R1'IN 8.BITI)
		LSL R1, R1, #1		//	R1 1 BIT sola kaydırdık
		ORR R3, R1, R2		//	LSB bitine R2 degerini koyduk
		
		STRB R3, [R0], #1
		SUB R8, R8, #1
		B LOOP				// KRIPTO YAPAR
		
END:	B END

VAL: .word 0x67616c46		// encryp 0xcec2d88c