WriteOAMDMACodeToHRAM::
	ld c, LOW(hTransferVirtualOAM)
	ld b, OAMDMACodeEnd - OAMDMACode
	ld hl, OAMDMACode
.copy
	ld a, [hli]
	ld [c], a
	inc c
	dec b
	jr nz, .copy
	ret

OAMDMACode:
	ldh [rDMA], a
	ld a, 40
.wait
	dec a
	jr nz, .wait
	ret
OAMDMACodeEnd:
