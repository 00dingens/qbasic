g = 39
r = SQR(80)
DIM a(g), n(g), m(g)
pi = 3.141592653# * 2 / (g + 1)
FOR x = 0 TO g
 n(x) = r * SIN(pi * x)
 m(x) = r * COS(pi * x)
NEXT x
SCREEN 9, , 0, 1
DO
 FOR y = 0 TO g
  CLS
  FOR z = 0 TO g
   h = (x + y) MOD (g + 1)
   j = (h + ((g + 1) * .25)) MOD (g + 1)
   LINE (100 + n(h) * n(z), 250 + m(h) * n(z))-(250 + n(j) * m(z), 100 + m(j) * m(z))
   LINE (300, 250 + m(h) * n(z))-(400, 250 + m(j) * m(z))
  NEXT z
  PCOPY 0, 1
  IF INKEY$ = " " THEN FOR x = 1 TO 100000: NEXT x
  IF INKEY$ = CHR$(13) THEN END
 NEXT y
LOOP

