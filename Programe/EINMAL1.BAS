
'erzeugt eine Datei mit allen 1x1-Aufgaben zum öben
'erst pro Reihe 30 Aufgaben
' zB. 1er-Reihe 1xX, Xx1, Y:1 alle gemischt
'dann nochmal fÅr das ganze 1x1 gemischt

CLS
DIM i(10, 30) AS STRING
m$ = " " + CHR$(149)
OPEN "c:\rafael\einmal1.txt" FOR OUTPUT AS #1
FOR x = 1 TO 10
 PRINT #1, ""
 PRINT #1, STR$(x) + "er-Reihe"
 FOR Y = 1 TO 10
  i(x, Y * 3 - 3) = RIGHT$("  " + LTRIM$(STR$(x)), 3) + m$ + RIGHT$(" " + LTRIM$(STR$(Y)), 2) + " = "
  i(x, Y * 3 - 2) = RIGHT$("  " + LTRIM$(STR$(Y)), 3) + m$ + RIGHT$(" " + LTRIM$(STR$(x)), 2) + " = "
  i(x, Y * 3 - 1) = RIGHT$("  " + LTRIM$(STR$(x * Y)), 3) + " :" + RIGHT$(" " + LTRIM$(STR$(x)), 2) + " = "
 NEXT Y
 FOR Y = 0 TO 29
  SWAP i(x, Y), i(x, INT(RND * 29))
 NEXT Y
 FOR Y = 0 TO 29
  PRINT #1, i(x, Y)
  IF Y MOD 5 = 4 THEN PRINT #1, ""
 NEXT Y
NEXT x
FOR x = 1 TO 10
 FOR Y = 0 TO 29
  SWAP i(x, Y), i(INT(RND * 10 + 1), INT(RND * 29))
 NEXT Y
NEXT x
PRINT #1, ""
PRINT #1, "Alle"
FOR x = 1 TO 10
 FOR Y = 0 TO 29
  PRINT #1, i(x, Y)
  IF Y MOD 5 = 4 THEN PRINT #1, ""
 NEXT Y
NEXT x
CLOSE

