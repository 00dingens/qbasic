
'wie txtmak1 aber nicht fÅr Courier sondern fÅr Verdana (CTeens)

ON ERROR GOTO e
DIM z(2) AS INTEGER, q(0) AS STRING * 1

INPUT "Replace eingeben /-1 \+1:", replace
''replace = 2              'verschieben: /-1   \+1
INPUT "Bildnummer eingeben:", bnr$
IF bnr$ = "" THEN END

SCREEN 13
OPEN "c:\windows\desktop\" + bnr$ + ".bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\" + bnr$ + ".txt" FOR OUTPUT AS #2
GET #1, 19, z(1)
GET #1, 23, z(2)
DIM w(z(2)) AS STRING
a = 55
FOR y = 1 TO z(2)
 xpos = 0
 FOR x = 1 TO z(1)
  GET #1, a, q(0)
  c = ASC(q(0))
  GET #1, a + 1, q(0)
  c = c + ASC(q(0))
  GET #1, a + 2, q(0)
  c = c + ASC(q(0))
  c = CINT(c * 8 / 765)
  IF x < 300 AND y < 180 THEN PSET (10 + x, 190 - y), 16 + INT(c * 1.9)
  DO
   SELECT CASE c
   CASE 0: w(y) = w(y) + "M": xpos = xpos + 12 / 14
   CASE 1: w(y) = w(y) + "#": xpos = xpos + 12 / 15
   CASE 2: w(y) = w(y) + "%": xpos = xpos + 12 / 11
   CASE 3: w(y) = w(y) + "/": xpos = xpos + 12 / 26
   CASE 4: w(y) = w(y) + "7": xpos = xpos + 12 / 19
   CASE 5: w(y) = w(y) + "<": xpos = xpos + 12 / 15
   CASE 6: w(y) = w(y) + ":": xpos = xpos + 12 / 26
   CASE 7: w(y) = w(y) + ".": xpos = xpos + 12 / 33
   CASE 8: w(y) = w(y) + "¥": xpos = xpos + 12 / 19
   CASE ELSE: PRINT "ERROR": END
   END SELECT
  LOOP UNTIL xpos > x
  a = a + 3
 NEXT x
 a = a + replace
 'alles was rechts und leer ist entfernen...
 DO: w(y) = LEFT$(w(y), LEN(w(y)) - 1): LOOP UNTIL RIGHT$(w(y), 1) <> "¥"
NEXT y
'in datei schreiben
PRINT #2, "Tut mir leid, wenn das etwas lÑnger gedauert hat. Ich hebe in letzter Zeit keine Bilder zu machen geschafft, und habe die jetzt alle in einem Rutsch gemacht."
FOR x = 1 TO z(1) * 1.7
 PRINT #2, "X";
NEXT x
PRINT #2, ""
FOR y = z(2) TO 1 STEP -1
 PRINT #2, w(y)
NEXT y
CLOSE
DO: LOOP WHILE INKEY$ = ""
CLS
END
e: RESUME NEXT

