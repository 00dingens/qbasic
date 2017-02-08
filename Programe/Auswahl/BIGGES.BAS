SCREEN 12
INPUT "Max. 8 Zeichen"; q$(0)
CLS
PRINT q$(0)
FOR x = 0 TO LEN(q$(0)) * 8
 FOR y = 1 TO 8
  n = POINT(x, y * 2): m = POINT(x, y * 2 + 1)
  IF n <> 0 AND m <> 0 THEN q$(y) = q$(y) + "Û"
  IF n <> 0 AND m = 0 THEN q$(y) = q$(y) + "ß"
  IF n = 0 AND m <> 0 THEN q$(y) = q$(y) + "Ü"
  IF n = 0 AND m = 0 THEN q$(y) = q$(y) + " "
 NEXT y
NEXT x
DO
FOR y = 1 TO 8
 PRINT q$(y)
NEXT y
LOOP WHILE INKEY$ = ""

