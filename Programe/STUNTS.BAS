ON ERROR GOTO er
DIM a(100, 18), z(30, 30), q(0) AS STRING * 1
SCREEN 12
'0
LINE (0, 0)-(9, 9), 2, BF
GET (0, 0)-(9, 9), a(0, 0)
'1
LINE (0, 0)-(9, 9), 1, BF
GET (0, 0)-(9, 9), a(0, 1)
'2
LINE (0, 0)-(9, 9), 1, BF
LINE (0, 0)-(9, 9), 2
LINE -(9, 0), 2
LINE -(0, 0), 2
PAINT (8, 2), 2, 2
GET (0, 0)-(9, 9), a(0, 2)
'3
LINE (0, 0)-(9, 9), 1, BF
LINE (9, 0)-(0, 9), 2
LINE -(0, 0), 2
LINE -(9, 0), 2
PAINT (2, 2), 2, 2
GET (0, 0)-(9, 9), a(0, 3)
'4
LINE (0, 0)-(9, 9), 1, BF
LINE (0, 0)-(9, 9), 2
LINE -(0, 9), 2
LINE -(0, 0), 2
PAINT (2, 8), 2, 2
GET (0, 0)-(9, 9), a(0, 4)
'5
LINE (0, 0)-(9, 9), 1, BF
LINE (9, 0)-(0, 9), 2
LINE -(9, 9), 2
LINE -(9, 0), 2
PAINT (8, 8), 2, 2
GET (0, 0)-(9, 9), a(0, 5)
'6
LINE (0, 0)-(9, 9), 10, BF
GET (0, 0)-(9, 9), a(0, 6)
'7
LINE (0, 0)-(9, 4), 10, BF
LINE (0, 5)-(9, 9), 2, BF
LINE (0, 3)-(9, 3), 2, , &H5555
LINE (0, 4)-(9, 4), 2, , &HAAAA
LINE (0, 5)-(9, 5), 10, , &HAAAA
LINE (0, 6)-(9, 6), 10, , &H5555
GET (0, 0)-(9, 9), a(0, 7)
'8
LINE (0, 0)-(4, 9), 10, BF
LINE (5, 0)-(9, 9), 2, BF
LINE (3, 0)-(3, 9), 2, , &H5555
LINE (4, 0)-(4, 9), 2, , &HAAAA
LINE (5, 0)-(5, 9), 10, , &HAAAA
LINE (6, 0)-(6, 9), 10, , &H5555
GET (0, 0)-(9, 9), a(0, 8)
'9
LINE (0, 0)-(9, 4), 2, BF
LINE (0, 5)-(9, 9), 10, BF
LINE (0, 3)-(9, 3), 10, , &HAAAA
LINE (0, 4)-(9, 4), 10, , &H5555
LINE (0, 5)-(9, 5), 2, , &H5555
LINE (0, 6)-(9, 6), 2, , &HAAAA
GET (0, 0)-(9, 9), a(0, 9)
'10
LINE (0, 0)-(4, 9), 2, BF
LINE (5, 0)-(9, 9), 10, BF
LINE (3, 0)-(3, 9), 10, , &HAAAA
LINE (4, 0)-(4, 9), 10, , &H5555
LINE (5, 0)-(5, 9), 2, , &H5555
LINE (6, 0)-(6, 9), 2, , &HAAAA
GET (0, 0)-(9, 9), a(0, 10)
'11
LINE (0, 0)-(9, 9), 2, BF
LINE (0, 0)-(3, 0), 10
LINE -(0, 3), 10
LINE -(0, 0), 10
PAINT (1, 1), 10, 10
LINE (0, 2)-(2, 0), 2
LINE (0, 5)-(5, 0), 10
GET (0, 0)-(9, 9), a(0, 11)
'12
LINE (0, 0)-(9, 9), 2, BF
LINE (0, 9)-(4, 9), 10
LINE -(0, 5), 10
LINE -(0, 9), 10
PAINT (1, 8), 10, 10
LINE (0, 6)-(3, 9), 2
LINE (0, 3)-(6, 9), 10
GET (0, 0)-(9, 9), a(0, 12)
'13
LINE (0, 0)-(9, 9), 2, BF
LINE (9, 9)-(6, 9), 10
LINE -(9, 6), 10
LINE -(9, 9), 10
PAINT (8, 8), 10, 10
LINE (9, 7)-(7, 9), 2
LINE (9, 4)-(4, 9), 10
GET (0, 0)-(9, 9), a(0, 13)
'14
LINE (0, 0)-(9, 9), 2, BF
LINE (9, 0)-(5, 0), 10
LINE -(9, 4), 10
LINE -(9, 0), 10
PAINT (8, 1), 10, 10
LINE (9, 3)-(6, 0), 2
LINE (9, 6)-(3, 0), 10
GET (0, 0)-(9, 9), a(0, 14)
'15
LINE (0, 0)-(9, 9), 10, BF
LINE (9, 9)-(5, 9), 2
LINE -(9, 5), 2
LINE -(9, 9), 2
PAINT (8, 8), 2, 2
LINE (9, 6)-(6, 9), 10
LINE (9, 3)-(3, 9), 2
GET (0, 0)-(9, 9), a(0, 15)
'16
LINE (0, 0)-(9, 9), 10, BF
LINE (9, 0)-(6, 0), 2
LINE -(9, 3), 2
LINE -(9, 0), 2
PAINT (8, 1), 2, 2
LINE (9, 5)-(4, 0), 2
LINE (9, 2)-(7, 0), 10
GET (0, 0)-(9, 9), a(0, 16)
'17
LINE (0, 0)-(9, 9), 10, BF
LINE (0, 0)-(4, 0), 2
LINE -(0, 4), 2
LINE -(0, 0), 2
PAINT (1, 1), 2, 2
LINE (0, 3)-(3, 0), 10
LINE (0, 6)-(6, 0), 2
GET (0, 0)-(9, 9), a(0, 17)
'18
LINE (0, 0)-(9, 9), 10, BF
LINE (0, 9)-(3, 9), 2
LINE -(0, 6), 2
LINE -(0, 9), 2
PAINT (1, 8), 2, 2
LINE (0, 4)-(5, 9), 2
LINE (0, 7)-(2, 9), 10
GET (0, 0)-(9, 9), a(0, 18)

CLS
OPEN "d:\spiele\stunts\land.trk" FOR BINARY AS #1
FOR x = 1 TO 30
 FOR y = 1 TO 30
  GET #1, y * 30 + x + 871, q(0)
  z(x, y) = ASC(q(0))
  PUT (x * 10, y * 10), a(0, z(x, y)), PSET
 NEXT y
NEXT x

n = 15: m = 15
mal:
CLS
FOR x = 1 TO 30
 FOR y = 1 TO 30
  PUT (x * 10, y * 10), a(0, z(x, y)), PSET
 NEXT y
NEXT x
FOR x = 0 TO 18
 LOCATE x + 1, 80: PRINT CHR$(x + 97);
 PUT (620, x * 16 + 3), a(0, x), PSET
NEXT x
LOCATE q + 1, 76: PRINT "->"
LOCATE 4, 45: PRINT "Position: ("; n; ","; m; ")  "
LOCATE 5, 46: IF activ = 0 THEN PRINT "Malen aus" ELSE PRINT "Malen an "
LOCATE 21, 50: PRINT "Entf  = malen an/aus"
LOCATE 22, 50: PRINT "Leer  = Karte fÅllen"
LOCATE 23, 50: PRINT "Esc   = Ende"
LOCATE 24, 50: PRINT "t     = Hilfslinien"
LOCATE 25, 50: PRINT "u     = Speichern"
LOCATE 26, 50: PRINT "Enter = aufnehmen"
LINE (n * 10, m * 10)-STEP(9, 9), 15, BF
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 PUT (n * 10, m * 10), a(0, z(n, m)), PSET
 SELECT CASE t$
 CASE CHR$(0) + "H": m = (m + 28) MOD 30 + 1
 CASE CHR$(0) + "P": m = m MOD 30 + 1
 CASE CHR$(0) + "K": n = (n + 28) MOD 30 + 1
 CASE CHR$(0) + "M": n = n MOD 30 + 1
 CASE " ":
  LOCATE 21, 1: PRINT "Mit welchem GelÑndetyp soll die Karte gefÅllt werden (Esc = Abbrechen)?"
  DO
   tt$ = INKEY$
  LOOP WHILE tt$ = ""
  ab = 0
  IF tt$ <= "s" AND tt$ >= "a" THEN gt = ASC(tt$) - 97 ELSE ab = 1
  IF ab = 0 THEN
   FOR x = 1 TO 30
    FOR y = 1 TO 30
     z(x, y) = gt
    NEXT y
   NEXT x
  END IF
  GOTO mal
  activ = 0
 CASE "t":
  LINE (10, m * 10)-(309, m * 10), 0
  LINE (10, m * 10 + 9)-(309, m * 10 + 9), 0
  LINE (n * 10, 10)-(n * 10, 309), 0
  LINE (n * 10 + 9, 10)-(n * 10 + 9, 309), 0
  DO: LOOP WHILE INKEY$ = ""
  LINE (10, m * 10)-(309, m * 10), 15
  LINE (10, m * 10 + 9)-(309, m * 10 + 9), 15
  LINE (n * 10, 10)-(n * 10, 309), 15
  LINE (n * 10 + 9, 10)-(n * 10 + 9, 309), 15
  FOR x = 1 TO 30
   FOR y = 1 TO 30
    PUT (x * 10, y * 10), a(0, z(x, y)), PSET
   NEXT y
  NEXT x
 CASE CHR$(27): EXIT DO
 CASE CHR$(13):
  LOCATE q + 1, 76: PRINT "  "
  q = z(n, m)
  LOCATE q + 1, 76: PRINT "->"
 CASE CHR$(0) + "S": activ = activ XOR 1
 CASE "u":
  CLS : PRINT
  PRINT " Landschaft speichern (j/n)?"
  DO: t$ = INKEY$: LOOP UNTIL t$ = "j" OR t$ = "n"
  IF t$ = "j" THEN
   FOR x = 1 TO 30
    FOR y = 1 TO 30
     q(0) = CHR$(z(x, y))
     PUT #1, y * 30 + x + 871, q(0)
    NEXT y
   NEXT x
  END IF
  GOTO mal
 CASE ELSE:
  IF t$ <= "s" AND t$ >= "a" THEN
   LOCATE q + 1, 76: PRINT "  "
   q = ASC(t$) - 97
   IF activ = 0 THEN z(n, m) = q
   LOCATE q + 1, 76: PRINT "->"
  END IF
 END SELECT
 LOCATE 4, 45: PRINT "Position: ("; n; ","; m; ")"
 LOCATE q + 1, 76: PRINT "  "
 IF activ = 1 THEN z(n, m) = q
 LOCATE q + 1, 76: PRINT "->"
 LINE (n * 10, m * 10)-STEP(9, 9), 15, BF
 LOCATE 5, 46: IF activ = 0 THEN PRINT "Malen aus" ELSE PRINT "Malen an "
LOOP
CLS : PRINT
PRINT " Landschafteneditor von Rafael fÅr Stunts beenden (j/n)?"
DO: t$ = INKEY$: LOOP UNTIL t$ = "j" OR t$ = "n"
IF t$ = "n" THEN GOTO mal
CLS : PRINT
PRINT " Landschaft speichern (j/n)?"
DO: t$ = INKEY$: LOOP UNTIL t$ = "j" OR t$ = "n"
IF t$ = "j" THEN
 FOR x = 1 TO 30
  FOR y = 1 TO 30
   q(0) = CHR$(z(x, y))
   PUT #1, y * 30 + x + 871, q(0)
  NEXT y
 NEXT x
END IF
CLOSE
END
er: RESUME NEXT

