INCLUDE "constants.asm"

SECTION "WRAM 0", WRAM0

	ds $10

wc010:: db
wc011:: db

	ds $5e

wNextInputDelay:: db
wCurrentInputDelay:: db

	ds $113

wc185:: db

	ds $aa

wc230:: ds $80

	ds $150

wc400:: ds $200

wc600:: ds $240

wc840:: ds $a7

wc8e7:: db
wc8e8:: ds 3

	ds $715

SECTION "WRAM 1", WRAMX

wd000:: ds $1000


INCLUDE "hram.asm"
