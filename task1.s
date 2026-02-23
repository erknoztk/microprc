.global _start

_start:
	// PRE DOLU TUTAR
	// POST BOŞ TUTAR
	
	LDR R0, =LOC // [R0] başlangıç değeri 0xA
	
	MOV R1, #1
	MOV R2, #2
	MOV R3, #3
	MOV R4, #4
	
	// R0 -> address tutar [R0] o addresste tutulan değer
	// 0xA yerine 1 yazıldı
	STR R1, [R0] // [LOC] = 1   R0 bellek address tutar [RO] address deki değer
	
	//ADD R0, R0, #4 // ADDRESS güncelledim önce ilerler sonra yaz
	//STR R2, [R0, #4]
	//STR R2, [R0, #4]! // ilerle yaz   tek satır
	STR R2, [R0], #4
	
	//ADD R0, R0, #4
	//STR R3, [R0, #8] 
	//STR R3, [R0, #4]!
	STR R3, [R0], #4
	
	//ADD R0, R0, #4				manuel
	//STR R4, [R0, #12]!			pre index	base reg. offset inc.
	//STR R4, [R0, #4]!				pre index + write back memory base reg inc offset.
	STR R4, [R0], #4
	
END:	B END


LOC:	.word 0xA

		.end
	
