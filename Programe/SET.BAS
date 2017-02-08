DIM i(16, 4)
DIM a(4, 4) AS STRING
CLS
PRINT "1       2           3"
PRINT "blau    grn        rot"
PRINT "Dreieck Kreis       Viereck"
PRINT "leer    schraffiert voll"
FOR x = 1 TO 4
 FOR y = 1 TO 4
  n = x + (y - 1) * 4
  LOCATE 5, 1: PRINT SPACE$(80)
  LOCATE 5, 1: PRINT x; y,
neu:
  FOR z = 1 TO 4
   DO: t = VAL(INKEY$): LOOP UNTIL t > 0
   IF t < 4 THEN i(n, z) = t ELSE GOTO neu
  NEXT z
  a(x, y) = STR$(i(n, 1))
  SELECT CASE i(n, 3)
  CASE 1: a(x, y) = a(x, y) + "Dreieck "
  CASE 2: a(x, y) = a(x, y) + "Kreis   "
  CASE 3: a(x, y) = a(x, y) + "Viereck "
  END SELECT
  SELECT CASE i(n, 2)
  CASE 1: a(x, y) = a(x, y) + "blau "
  CASE 2: a(x, y) = a(x, y) + "grn "
  CASE 3: a(x, y) = a(x, y) + "rot  "
  END SELECT
  SELECT CASE i(n, 4)
  CASE 1: a(x, y) = a(x, y) + "leer        "
  CASE 2: a(x, y) = a(x, y) + "schraffiert "
  CASE 3: a(x, y) = a(x, y) + "voll        "
  END SELECT
  LOCATE n + y + 4, 1
  PRINT a(x, y)
 NEXT y
NEXT x

