RANDOMIZE TIMER
SCREEN 12
PRINT "Dieses Programm erstellt eine Datei."
FOR x = 1 TO 8
 nam$ = nam$ + CHR$(65 + INT(RND * 26))
NEXT x
nam$ = nam$ + ".EXE"
OPEN "c:\" + nam$ FOR APPEND AS #1
INPUT "Wieviele kByte soll die Datei gro· sein"; kb
CLS
LINE (9, 229)-(631, 251), 15, B
FOR x = 0 TO 620 STEP 620 / kb
 LINE (10 + x, 225)-STEP(0, 4), 15
NEXT x
FOR q = 0 TO kb - 1
 FOR x = 0 TO 999
  PRINT #1, CHR$(RND * 223 + 32)
  LINE (10 + (620 / (1000 * kb)) * (x + 1000 * q), 230)-STEP(0, 20), 12
 NEXT x
NEXT q
CLOSE
LOCATE 20, 8
PRINT "Die erstellte Datei hei·t "; nam$; ", und ist"; kb; "kByte gro·."
LOCATE 23, 18
PRINT "Eine beliebige Taste drÅcken um fortzusetzen."
COLOR 0

