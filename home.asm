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
	dr $09c7, $127d

INCLUDE "home/gfx.asm"

Func_12a4:
	dr $12a4, $2093

VBlank:
	dr $2093, $2164

INCLUDE "data/leaderboard.asm"

unk_21e4:
	dr $21e4, $4000
