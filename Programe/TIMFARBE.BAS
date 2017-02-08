RANDOMIZE TIMER
SCREEN 7
DO
 OUT &H3C8, 0
 OUT &H3C9, INT(RND * 64)
 OUT &H3C9, INT(RND * 64)
 OUT &H3C9, INT(RND * 64)
 FOR x = 1 TO 30000: NEXT x
LOOP WHILE INKEY$ = ""
r = INT(RND * 64): g = INT(RND * 64): b = INT(RND * 64)
rr = INT(RND * 6 - 2.5) * 2: gg = INT(RND * 6 - 2.5) * 2: bb = INT(RND * 6 - 2.5) * 2
DO
 OUT &H3C8, 0
 OUT &H3C9, r
 OUT &H3C9, g
 OUT &H3C9, b
 r = r + rr: g = g + gg: b = b + bb
 IF r < 0 OR r > 63 THEN r = r - rr: rr = SGN(rr) * -INT(RND * 2 + 1)
 IF g < 0 OR g > 63 THEN g = g - gg: gg = SGN(gg) * -INT(RND * 2 + 1)
 IF b < 0 OR b > 63 THEN b = b - bb: bb = SGN(bb) * -INT(RND * 2 + 1)
 FOR x = 1 TO 900: NEXT x
LOOP WHILE INKEY$ = ""

