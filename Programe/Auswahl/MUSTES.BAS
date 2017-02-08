RANDOMIZE TIMER
DIM a(16383)
SCREEN 2
r = 320
FOR x = 0 TO r
 LINE (x * 2, 199)-STEP(1, 0), INT(RND * 2)
NEXT x
DO
 FOR z = 0 TO 1
  GET (0, 1)-(639, 200), a
  PUT (0, 0), a, PSET
  FOR x = 1 TO r
   IF POINT(x * 2, 198) <> POINT(x * 2 + 2, 198) THEN
    LINE (x * 2 + z, 199)-STEP(1, 0), 1
   END IF
  NEXT x
 NEXT z
LOOP WHILE INKEY$ = ""

'DO: LOOP WHILE INKEY$ = ""

