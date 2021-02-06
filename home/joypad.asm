UpdateJoypad::
; We can only get four inputs at a time.
; We take d-pad first for no particular reason.
	ld a, R_DPAD
	ldh [rJOYP], a
; Read twice to give the request time to take.
	ldh a, [rJOYP]
	ldh a, [rJOYP]

; The Joypad register output is in the lo nybble (inversed).
; We make the hi nybble of our new container d-pad input.
	cpl
	and $0f
	swap a

; We'll keep this in b for now.
	ld b, a

; Buttons make 8 total inputs (A, B, Select, Start).
; We can fit this into one byte.
	ld a, R_BUTTONS
; Wait for input to stabilize.
	ldh [rJOYP], a
REPT 8
	ldh a, [rJOYP]
ENDR
; Buttons take the lo nybble.
	cpl
	and $0f
	or b
	ld c, a

; To get the delta we xor the last frame's input with the new one.
	ld a, [hli]
	xor c
	and c
	ld [hld], a
	ld b, a
	ld a, c
	ld [hli], a

; Reset the joypad register since we're done with it.
	ld a, $30
	ldh [rJOYP], a

; Now that we have the input, we can do stuff with it.

; For example, soft reset:
	ld a, c
	cp  A_BUTTON | B_BUTTON | SELECT | START
	jp z, _Start

; Or, apply input delay to dpad presses:
	inc l
	ld a, b
	ld [hli], a
	and $f0
	jr z, .asm_0336
	ld a, [wNextInputDelay]
	ld [hl], a
	ret

.asm_0336
	dec [hl]
	ret nz
	ld a, [wCurrentInputDelay]
	ld [hld], a
	ld [hl], c
	ret
