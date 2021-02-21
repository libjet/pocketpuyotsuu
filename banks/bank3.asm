Func_03_4000:
	dr $c000, $c434

Func_03_4434:
	dr $c434, $c495

Func_03_4495:
	ld hl, wc146
; Only check right or left inputs
	ldh a, [hFFA8]
	and D_RIGHT | D_LEFT
	ret z

; Jump if we -haven't- pressed left
	cp D_LEFT
	jr nz, .increment_selection

; Check if we're already at the minimum selection
	ld a, [wc140]
	cp [hl]
	ret z
; Decrement
	dec a
	ld [wc140], a
	jr .asm_44b6

.increment_selection:
; Check if we're already at the maximum selection
	ld a, [wc140]
	inc l
	cp [hl]
	ret z
; Increment
	inc a
	ld [wc140], a

.asm_44b6:
	call Func_03_4434
	ld a, [wc144]
	inc a
	ld [wc144], a
	ld a, $22
	call Func_3a2d
	ret

Func_03_44c6:
	dr $c4c6, $10000
