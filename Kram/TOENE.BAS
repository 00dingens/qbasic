x = 50
DO
 t$ = INKEY$
 IF t$ <> "" THEN
  SELECT CASE t$
  CASE CHR$(13): an = an XOR 1
  CASE CHR$(27): END
  END SELECT
 END IF
 LOCATE 1, 1: PRINT x
 IF an = 1 THEN SOUND x, .05
LOOP

