INCLUDE "constants.asm"


INCLUDE "home/header.asm"

SECTION "Home", ROM0

_Start::
	dr $0150, $09c7

unk_09c7:
	dr $09c7, $127d

INCLUDE "home/gfx.asm"

unk_12a4:
	dr $12a4, $2093

VBlank:
	dr $2093, $4000
