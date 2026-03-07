.global _start
_start:
		
		LDR R1, TEST_NUM
		MOV R0, #0 // total 1's count
	
LOOP:	CMP R1, #0 // R1 == 0 loop dan cık
		BEQ END
		
		AND R2, R1, #1  // 00000001 ile r1 and le r2 ise R0 güncelle -- EK = LSB 2 işlem ile
		ADD R0, R0, R2	// r2 1 gelir ve r0 a eklenir mantık r0 += 1
		LSR R1, R1, #1
		B LOOP
		
END:
	AND R7, R0, #1 //	even parity bit verildi R7 değeri even için OK
		
	//	AND	R3, R8, #1   	//	LSB R3 suan lsb tutuyor
	BIC	R8, R8, #1		 	//	R8 son biti temizlendi 0 - 0, 1 - 0 
	//	MOV R3, R7
	ORR R8, R8, R3	 	 	//	R8 R3 OR  işlemi r8 son bit 0 lsb bit ne ise son bit o olur
	
				  	 	 	//	odd parity için ek XOR dönüşüm çünkü  R7 1 gelirse R7 O olmalı
	EOR R7, R7, #1		 	//	R7 0 gelirse R8 1 olmalı TERSLENMELİ
	
	MOV R3, R7, LSL#31	 	// R3 BURDA 0x(1-0)0000000
	MOV R4, #1				// 1..00 32 bit
	LSR R4, R4, #31
	BIC R8,R8, R4			// 32-bit sıfırlandı BIC amac operanda 1 olan bitler sıfırlanır
	ORR R8, R8, R3
	
	B	END

TEST_NUM: 
			.word 0xe79				// 1 sayısı 7 odd parity 0 vercem, even parity 1
			//	.word 0xfffffe78	//	1110 0111 1000 1 de 4 kere dönerken 0 da 3 kere dönmeli
						//	0001 1000 0111 --> 187


