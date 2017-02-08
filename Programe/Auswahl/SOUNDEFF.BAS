
'Soundeffekte mit PLAY

CLS
PLAY "t255O0L64cdefgab>cdefgab>cdefgab>cdefgab>cdefgab>cdefgab>cdefgab"

PRINT "1",

PLAY "O6L64cdefedcdededcdedcdededcdededededededededededededededededededede"

PRINT "2",

FOR x = 1 TO 20: PLAY "O1L64cO5b": NEXT x

PRINT "3",

PLAY "O6L64bagfedc<bagfedc<bagfedc<bagfedc<bagfedc<bagfedc<bagfedcccccccccccc"

PRINT "4",

PLAY "O0L64cdcdedefefgfgagabab>c<bO1L64cdcdedefefgfgagabab>c<b"
PLAY "O2L64cdcdedefefgfgagabab>c<bO3L64cdcdedefefgfgagabab>c<b"
PLAY "O4L64cdcdedefefgfgagabab>c<bO5L64cdcdedefefgfgagabab>c<b"
PLAY "O6L64cdcdedefefgfgagababbbbbb"

PRINT "5",

PLAY "O0L64cdecdefdefgefgafgabgab>c<ab>cd<bO1L64cdecdefdefgefgafgabgab>c<ab>cd<b"
PLAY "O2L64cdecdefdefgefgafgabgab>c<ab>cd<bO3L64cdecdefdefgefgafgabgab>c<ab>cd<b"
PLAY "O4L64cdecdefdefgefgafgabgab>c<ab>cd<bO5L64cdecdefdefgefgafgabgab>c<ab>cd<b"
PLAY "O6L64cdecdefdefgefgafgabgabbbbbbbbbbbbbb<fc<fc<fc<fc<fc<fccccccccccccccccc"

PRINT "6",

PLAY "O0L8EFGEFDC"

PRINT "7",

PLAY "O0L8>CCCE"

PRINT "8",

PLAY "L8O1>L20CDEDCDL10ECC"

PRINT "9",

FOR x = 1 TO 50
SOUND 3000, .023: SOUND 3050, .023: SOUND 3100, .023: SOUND 3150, .023
SOUND 3200, .023: SOUND 3150, .023
SOUND 3100, .023: SOUND 3150, .023: SOUND 3200, .023: SOUND 3250, .023
SOUND 3300, .023: SOUND 3250, .023: SOUND 3200, .023: SOUND 3150, .023
SOUND 3100, .023: SOUND 3150, .023
SOUND 3200, .023: SOUND 3150, .023: SOUND 3100, .023: SOUND 3050, .023
NEXT x

PRINT "10",

RANDOMIZE TIMER
FOR x = 1 TO 1000
LET a = INT(RND * 10000) + 100
SOUND a, .03
NEXT x

PRINT "11",

FOR i% = 440 TO 1000 STEP 5
SOUND i%, i% / 1000
NEXT i%

PRINT "12"

DO
PLAY "t255O2L16d-n0n0d-n0L42d-n0n0d-l32n0n0d-n0n0d-l24d-n0n0d-n0n0"
PLAY "O2L16dn0n0dn0L42dn0n0dl32n0n0dn0n0dl24dn0n0dn0n0"
PLAY "O2L16d+n0n0d+n0L42d+n0n0d+l32n0n0d+n0n0d+l24d+n0n0d+n0n0"
PLAY "O2L16dn0n0dn0L42dn0n0dl32n0n0dn0n0dl24dn0n0dn0n0"
LOOP WHILE INKEY$ = ""
PLAY "O2L16d-n0n0d-n0L42d-n0n0d-l32n0n0d-n0n0d-l24d-n0n0d-n0n0"
PLAY "O2L16dn0n0dn0L42dn0n0dl32n0n0dn0n0dl24dn0n0dn0n0"
PLAY "O2L16d+n0n0d+n0L42d+n0n0d+l32n0n0d+n0n0d+l24d+n0n0d+n0n0"
PLAY "t128O2L2d"

