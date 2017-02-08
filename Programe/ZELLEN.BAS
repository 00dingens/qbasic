
'spiel des lebens

DIM n(320, 200) AS STRING * 1
xx = 50: yy = 50
SCREEN 7, , 0, 0        '0,1
DO: LOOP WHILE INKEY$ = ""
FOR y = 0 TO yy
 FOR x = 0 TO xx
  PSET (x, y), INT(RND * 2) * 15
 NEXT x
NEXT y
DO
' CIRCLE (xx / 2, yy / 2), (xx + yy) / 5, 15
' LINE (0, 0)-(xx, yy)
 PCOPY 0, 1
 FOR y = 0 TO yy
  FOR x = 0 TO xx
   wert = 0
   FOR a = -1 TO 1
    FOR b = -1 TO 1
     wert = wert + POINT((x + a + xx) MOD xx, (y + b + yy) MOD yy) / 15
    NEXT b
   NEXT a
   n(x, y) = CHR$(0)
   IF wert = 3 THEN n(x, y) = CHR$(15)
   IF POINT(x, y) = 15 AND wert = 2 THEN n(x, y) = CHR$(15)
  NEXT x
 NEXT y
 FOR y = 0 TO yy
  FOR x = 0 TO xx
   PSET (x, y), ASC(n(x, y))
  NEXT x
 NEXT y
LOOP WHILE INKEY$ = ""

