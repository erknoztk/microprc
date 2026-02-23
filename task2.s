.global _start

_start:
	
	// PRE INDEX NONE WRITE BACK
	//LDR R0, =LOCA
	//LDR R1, [R0]		// R1 0xA 		
	//LDR R2, [R0, #4]	// R2 0xB
	// R0 yine değişmiyor 0xA addresini işaret ediyor
	//STR R1, [R0, #4]
	//STR R2, [R0]
	
	// Check
	//LDR R1, [R0]
	//LDR R2, [R0, #4]
// --------------***********************-------------------
	// POST INDEX WRITE BACK
	
	//LDR R0, =LOCA // UNUTMA R0 LOC addresini tutar
	//MOV R3, R0 // R0 değerini tutucak
	//LDR R1, [R0],#4 // R0 okudu sonrak ilerledi = R0 + 4
	//LDR R2, [R0]	// R0+4
	
	//STR R1, [R0]
	//STR R2, [R3]
	
// --------------***********************-------------------

	// PRE INDEX AND WRITE BACK
	
	LDR R0, =LOCA

	LDR R1, [R0]
	LDR R2, [R0, #4]!
	
	STR R1, [R0]
	SUB R0, R0, #4 // BIR OFFSET GERİ
	STR R2, [R0]
	
	
	
END:	B END

LOCA:	.word 0xA
LOCB:	.word 0xB