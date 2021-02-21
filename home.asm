INCLUDE "constants.asm"


INCLUDE "home/header.asm"

SECTION "Home", ROM0

_Start::
	dr $0150, $0240

Func_0240:
	ld e, 16 * 8 ; 16 slots
	ld hl, LeaderboardEntries
	ld bc, wSavedata
.copy
	ld a, [hli]
	ld [bc], a
	inc c
	dec e
	jr nz, .copy
	ret

Func_024f:
	dr $024f, $02f2

INCLUDE "home/joypad.asm"
INCLUDE "home/load_push_oam.asm"

Func_0354:
	dr $0354, $09c7

Func_09c7:
	dr $09c7, $0c71

Func_0c71:
	dr $0c71, $1167

Func_1167:
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Decompress
	ld a, [wc051]
	and %11011111 ; reset bit 5
	ld [wc051], a
	sub a
	ld [wc062], a
	ld [wc063], a
	ret

Call_000_117d:
	dr $117d, $127d

INCLUDE "home/gfx.asm"

Func_12a4:
	dr $12a4, $2093

INCLUDE "home/vblank.asm"

INCLUDE "data/leaderboard.asm"

unk_21e4:
	dr $21e4, $3000

Func_3000:
	dr $3000, $3a2d

Func_3a2d::
	dr $3a2d, $4000
