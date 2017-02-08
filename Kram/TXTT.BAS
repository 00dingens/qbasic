SCREEN 7
OPEN "c:\a\qb\progs\text.bas" FOR APPEND AS #1
'PRINT #1, "select case a$"
DO
 q$ = ""
 CLS

 LINE (15, 15)-(55, 75), 7, B
 LINE (15, 45)-(55, 45), 7
 FOR x = 1 TO 5
  FOR y = 1 TO 7
   LINE (x * 10, y * 10)-STEP(10, 10), 8, B
  NEXT y
 NEXT x


 FOR x = 1 TO 5
 z = 0
 
  FOR y = 1 TO 7
   LINE (x * 10, y * 10)-STEP(10, 10), 7, B
   DO: t$ = INKEY$: LOOP WHILE t$ = ""
   z = z * 2
   IF t$ = "n" THEN z = z + 1: LINE (x * 10, y * 10)-STEP(10, 10), 15, BF
 
  NEXT y
  q$ = q$ + CHR$(z)
 NEXT x
 INPUT w$
 PRINT #1, "case " + CHR$(34) + w$ + CHR$(34) + ": q$=" + CHR$(34) + q$ + CHR$(34)
LOOP UNTIL w$ = "Z"

'PRINT #1, "end select"
CLOSE

