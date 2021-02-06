INCLUDE "constants.asm"

SECTION "WRAM 0", WRAM0

	ds $10

wc010:: db
wc011:: db

	ds $173

wc185:: db

	ds $214

wc400:: ds $200

wc600:: ds $240

wc840:: ds $7c0

SECTION "WRAM 1", WRAMX

wd000:: ds $1000


INCLUDE "hram.asm"
