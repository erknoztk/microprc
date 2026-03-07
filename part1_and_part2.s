.global _start
_start:
		
		LDR R1, TEST_NUM
		//	MVN R1, R1 // 0 - 1 convert part2
		MOV R0, #0 // PATTERN max_count
	
LOOP:	CMP R1, #0 // R1 == 0 loop dan cık
		BEQ END
		
		LSR R2, R1, #1 // bitwise operation
		AND R1, R1, R2 
		
		ADD R0, R0, #1 // anlasılır hal
		B LOOP
		
END:
	//	MOV R7, R0	// part 2 
	B	END

TEST_NUM: 
			.word 0x103fe00f
			//	.word 0xfffffe78	//	1110 0111 1000 1 de 4 kere dönerken 0 da 3 kere dönmeli
						//	0001 1000 0111 --> 187


