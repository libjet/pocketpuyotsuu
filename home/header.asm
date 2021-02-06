; rst vectors (called through the rst instruction)

SECTION "rst0", ROM0
	ldh [hFFF0], a
	ldh a, [hFF90]
	push af
	ldh a, [hFFF0]
	ldh [hFF90], a
	ld [$2000], a
	call unk_09c7
	pop af
; SECTION "rst10", ROM0[$0010]
	ldh [hFF90], a
	ld [$2000], a
	ret

SECTION "rst20", ROM0
	jp hl

SECTION "rst38", ROM0
	jp $f080 ; echo of $d080


; Game Boy hardware interrupts

SECTION "vblank", ROM0
	push af
	push bc
	push de
	push hl
	jp VBlank

SECTION "lcd", ROM0
	push af
	ldh a, [hFF8E]
	ldh [rLCDC], a
	pop af
	reti

SECTION "timer", ROM0
	push af
	ld a, %11
	ldh [rTAC], a
	jr Timer

SECTION "serial", ROM0
	push af
	push hl
	jr Serial

SECTION "joypad", ROM0
	reti


SECTION "Header Code", ROM0

Serial:
	dr $0061, $00c5

Timer:
	ld a, $81
	ldh [rSC], a
	ld [wc185], a
	pop af
	reti

unk_00ce:
	dr $00ce, $0100


SECTION "Header", ROM0[$0100]

Start::
	nop
	jp _Start

; The Game Boy cartridge header data is patched over by rgbfix.
; This makes sure it doesn't get used for anything else.

	ds $0150 - @, $00
