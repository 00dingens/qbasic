DIM i(100, 4)      'die verschiedenen stellungen
DIM o(100, 7)      'die verschiedenen verknÅpfungen

SCREEN 7
PAINT (0, 0), 15
x = 0: y = 0: nr = 0
FOR w1 = 1 TO 9
 FOR w2 = w1 + 1 TO 10
  FOR s1 = 1 TO 9
   FOR s2 = s1 + 1 TO 10
    xw1 = INT(((w1 MOD 5) + 2) * 4) MOD 10
    yw1 = INT(w1 / 5.3 * 2) * 2
    xw2 = INT(((w2 MOD 5) + 2) * 4) MOD 10
    yw2 = INT(w2 / 5.3 * 2) * 2
    xs1 = INT(((s1 MOD 5) + 2) * 4) MOD 10
    ys1 = INT(s1 / 5.3 * 2) * 2
    xs2 = INT(((s2 MOD 5) + 2) * 4) MOD 10
    ys2 = INT(s2 / 5.3 * 2) * 2
    IF ABS(xw1 - xs1) = ABS(yw1 - ys1) OR ABS(xw1 - xs2) = ABS(yw1 - ys2) OR ABS(xw2 - xs1) = ABS(yw2 - ys1) OR ABS(xw2 - xs2) = ABS(yw2 - ys2) THEN GOTO gehtnicht
    FOR z = 0 TO 7
     IF z MOD 4 < 2 THEN LINE (x, y + z)-(x + 9, y + z), 0, , &H3333 ELSE LINE (x, y + z)-(x + 9, y + z), 0, , &HCCCC
    NEXT z
    LINE (x + xw1, y + yw1)-STEP(1, 1), 9, BF
    LINE (x + xw2, y + yw2)-STEP(1, 1), 9, BF
    LINE (x + xs1, y + ys1)-STEP(1, 1), 10, BF
    LINE (x + xs2, y + ys2)-STEP(1, 1), 10, BF
    x = x + 14
    IF x > 130 THEN y = y + 14: x = 0
    nr = nr + 1: i(nr, 1) = w1: i(nr, 2) = w2: i(nr, 3) = s1: i(nr, 4) = s2
gehtnicht:
   NEXT s2
  NEXT s1
 NEXT w2
NEXT w1
DO: LOOP WHILE INKEY$ = ""
FOR x = 1 TO 100
 LINE (0, 0)-(319, 199), 15, BF

 xw1 = INT(((i(x, 1) MOD 5) + 2) * 2) MOD 5
 yw1 = INT(i(x, 1) / 5.3 * 2)
 xw2 = INT(((i(x, 2) MOD 5) + 2) * 2) MOD 5
 yw2 = INT(i(x, 2) / 5.3 * 2)
 xs1 = INT(((i(x, 3) MOD 5) + 2) * 2) MOD 5
 ys1 = INT(i(x, 3) / 5.3 * 2)
 xs2 = INT(((i(x, 4) MOD 5) + 2) * 2) MOD 5
 ys2 = INT(i(x, 4) / 5.3 * 2)
 FOR z = 0 TO 31
  IF z MOD 16 < 8 THEN LINE (200, 90 + z)-(239, 90 + z), 0, , &HFF ELSE LINE (200, 90 + z)-(239, 90 + z), 0, , &HFF00
 NEXT z
 LINE (201 + xw1 * 8, 91 + yw1 * 8)-STEP(5, 5), 9, BF
 LINE (201 + xw2 * 8, 91 + yw2 * 8)-STEP(5, 5), 9, BF
 LINE (201 + xs1 * 8, 91 + ys1 * 8)-STEP(5, 5), 10, BF
 LINE (201 + xs2 * 8, 91 + ys2 * 8)-STEP(5, 5), 10, BF
NEXT x

