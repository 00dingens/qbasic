RANDOMIZE TIMER
DIM a(101) AS INTEGER
SCREEN 13
FOR x = 1 TO 63
OUT &H3C8, x
OUT &H3C9, x
OUT &H3C9, x
OUT &H3C9, x
NEXT x

DO
 FOR x = 1 TO 100
  a(x) = x
 NEXT x

 FOR i = 1 TO 1
  GOSUB invert
 NEXT i

 FOR i = 0 TO 100
  PSET (i, a(i)), (POINT(i, a(i)) + 1) MOD 64
  'LINE (0, i)-(INT((a(i - 2) + a(i - 1) + a(i) + a(i + 1) + a(i + 2)) / 5), i)
  'LINE (0, i)-(a(i), i)
  'PRINT a(i);
 NEXT i
LOOP WHILE INKEY$ = ""
END

invert:
x1 = INT(RND * 98 + 1)
x2 = INT(RND * 98 + 1)
IF x1 > x2 THEN SWAP x1, x2
'PRINT x1, x2, INT(ABS((x2 - x1) / 2))
FOR x = 0 TO INT(ABS((x2 - x1) / 2))
 SWAP a(x1 + x), a(x2 - x)
NEXT x
RETURN

