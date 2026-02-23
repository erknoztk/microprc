.global _start

_start:

	LDR R0, =LOC
	
	// post index
	LDRB R1, [R0], #1 // AB yi tutar
	LDRB R2, [R0]
	
	STRB R1,[R0]
	SUB R0, R0, #1
	STRB R2,[R0]
	
	// Check
	LDR R3, =LOC
	LDR R4, [R3]
	
END:	B END

LOC:	.word 0x12AB
