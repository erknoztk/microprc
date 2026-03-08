.global _start
_start:
	
	// read byte in memory
	LDR R0,=VAL
	MOV R8, #4
LOOP:	
		CMP R8, #0
		BEQ END
		// LDRB
		LDRB R1, [R0]
		
		AND R2, R1, #1	//	R2 R1 IN LSB	R2:0000000(0-1)
		LSL R2, R2, #7	//	R2 7 BİT SOL MSB	R2:(0-1)0000000
		LSR R1, R1, #1	//	R1 1 BİT SAĞA KAYDI 
		ORR R3, R1, R2	//	R1 ORR R2 İLE R1 MSB GÜNCELLENDİ
		
		STRB R3, [R0], #1
		SUB R8, R8, #1
	
		B LOOP				
		
END:	B END

VAL: .word 0xCEC2D88C	// decryp hali 0x67616c46