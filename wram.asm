INCLUDE "constants.asm"

SECTION "WRAM 0", WRAM0

	ds $10

wc010:: db
wc011:: db
wc012:: db

	ds $3e

wc051:: db

	ds $10

wc062:: db
wc063:: db

	ds 12

wNextInputDelay:: db
wCurrentInputDelay:: db

	ds $ce

wc140:: db
wc141:: db
wc142:: db
wc143:: db
wc144:: db
wc145:: db
wc146:: db

	ds $3e

wc185:: db

	ds $aa

wSavedata::
wSavedataSlot1::  savedata_struct wSavedataSlot1
wSavedataSlot2::  savedata_struct wSavedataSlot2
wSavedataSlot3::  savedata_struct wSavedataSlot3
wSavedataSlot4::  savedata_struct wSavedataSlot4
wSavedataSlot5::  savedata_struct wSavedataSlot5
wSavedataSlot6::  savedata_struct wSavedataSlot6
wSavedataSlot7::  savedata_struct wSavedataSlot7
wSavedataSlot8::  savedata_struct wSavedataSlot8
wSavedataSlot9::  savedata_struct wSavedataSlot9
wSavedataSlot10:: savedata_struct wSavedataSlot10
wSavedataSlot11:: savedata_struct wSavedataSlot11
wSavedataSlot12:: savedata_struct wSavedataSlot12
wSavedataSlot13:: savedata_struct wSavedataSlot13
wSavedataSlot14:: savedata_struct wSavedataSlot14
wSavedataSlot15:: savedata_struct wSavedataSlot15
wSavedataSlot16:: savedata_struct wSavedataSlot16

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
