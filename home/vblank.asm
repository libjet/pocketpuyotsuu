VBlank:
	ld hl, wc012
	bit 0, [hl]
	jr nz, .exit

	ld [hl], 1
	ld b, h
	ld d, h
	ldh a, [rLY]
	cp 144
	jr c, .asm_20c5
	cp 148
	jr nc, .asm_20c5

	ld a, $d6
	call $ff80
	ei
	ldh a, [hBGP]
	ldh [rBGP], a
	ldh a, [hOBP0]
	ldh [rOBP0], a
	ldh a, [hOBP1]
	ldh [rOBP1], a
	ldh a, [hSCX]
	ldh [rSCX], a
	ldh a, [hSCY]
	ldh [rSCY], a
	call Func_0c71

.asm_20c5:
	ldh a, [rSTAT] ; ???
	ldh a, [hROMBank]
	push af
	ldh a, [hFF91]
	and $01
	call nz, Func_20ed
	call Func_3000
	pop af
	ldh [hROMBank], a
	ld [MBC1RomBank], a

	ld a, $01
	ld [wc010], a
	sub a
	ld [wc012], a
; wasted space
	pop hl
	pop de
	pop bc
	pop af
	reti

.exit
	pop hl
	pop de
	pop bc
	pop af
	reti

Func_20ed:
	dr $20ed, $2164
