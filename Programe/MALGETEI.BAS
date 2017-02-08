'erzeugt eine datei mit mal und geteilt-aufgaben
'kommazahlen mit 2 dezimalstellen

CLS
RANDOMIZE TIMER
DIM i(60, 3) AS INTEGER
DIM st(2) AS INTEGER
DIM o(60, 3) AS STRING
nl4$ = CHR$(13) + CHR$(10) + CHR$(13) + CHR$(10) + CHR$(13) + CHR$(10) + CHR$(13) + CHR$(10)
FOR x = 1 TO 60
 i(x, 0) = INT(RND * 90 + 10)
 i(x, 1) = INT(RND * 90 + 10)
 i(x, 2) = i(x, 0) * i(x, 1)

 sst = 0
 FOR ii = 0 TO 1
  st = INT(RND * 3)  'nachkommastellen
  sst = sst + st
  i1$ = LTRIM$(STR$(i(x, ii)))
  SELECT CASE st
  CASE 0: o(x, ii) = i1$
  CASE 1: o(x, ii) = LEFT$(i1$, 1) + "," + RIGHT$(i1$, 1)
  CASE 2: o(x, ii) = "0," + i1$
  END SELECT
 NEXT ii
 
 
 i1$ = LTRIM$(STR$(i(x, 2)))
 SELECT CASE sst
 CASE 0: o(x, 2) = i1$
 CASE 4: o(x, 2) = "0," + i1$
 CASE ELSE: o(x, 2) = LEFT$(i1$, 4 - sst) + "," + RIGHT$(i1$, sst)
 END SELECT
 aa$ = o(x, 0) + "x" + o(x, 1) + "=" + nl4$
 bb$ = o(x, 2) + ":" + o(x, 1) + "=" + nl4$
 IF RND < .5 THEN SWAP aa$, bb$
 a$ = a$ + aa$
 b$ = b$ + bb$ + CHR$(13) + CHR$(10)
NEXT x
PRINT a$
PRINT b$

OPEN "c:\rafael\malgetei.txt" FOR OUTPUT AS #1
PRINT #1, a$
PRINT #1, b$
CLOSE

