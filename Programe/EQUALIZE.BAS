ON ERROR GOTO e
DIM p(1000) AS DOUBLE, s(1000) AS DOUBLE, f(1000) AS DOUBLE
'position,speed,frequenzzahl
gf = 44000 'grundfrequenz i.e. samples p.s.
fs = 13.75  '440/32'startfrequenz
fe = 1760   'endfrequenz
ex = (fe / fs) ^ (1 / 168)
SCREEN 9, , 1, 0
'PRINT ex
'PSET (0, 0), 12
'DO: LOOP WHILE INKEY$ = ""
FOR x = 1 TO 168                'reset
 p(x) = 0'128
 s(x) = 0
 f(x) = .1 * (fs * ex ^ x) ^ 2 / gf
 LOCATE 1, 1: PRINT x, p(x), s(x)
 PRINT f(x)
 FOR z = 1 TO 100: NEXT z
NEXT x

DO
 n = (n + 1) MOD 1000
 t$ = INKEY$
 IF t$ = "m" THEN ii = (ii + 1) MOD 2
 IF n > 0 THEN i = 1
 IF n > 50 THEN i = -1
 IF ii = 1 THEN i = -i
 CLS
 FOR x = 1 TO 168 STEP 1
  s(x) = s(x) - p(x) * f(x)
  s(x) = s(x) * (1 - .01)
  p(x) = p(x) + s(x) + 1 * i / f(x) ^ (1 / 4)
  PSET (x, 130 - p(x))
 NEXT x
 PCOPY 1, 0
 'FOR z = 1 TO 100: NEXT z

LOOP UNTIL t$ = CHR$(27)
DO: LOOP WHILE INKEY$ = ""
END

e: PSET (x, 0), 14: RESUME NEXT

