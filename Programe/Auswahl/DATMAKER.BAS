
'Es wird eine Datei erstellt, die Platz einnimmt.

RANDOMIZE TIMER
SCREEN 12
FOR x = 1 TO 8
 nam$ = nam$ + CHR$(65 + INT(RND * 26))
NEXT x
nam$ = "c:\windows\desktop\" + nam$ + ".EXE"
OPEN nam$ FOR APPEND AS #1
INPUT "Wieviele kByte soll die Datei gro· sein"; kb
CLS
LINE (9, 229)-(631, 251), 15, B
ee = 1
www = 620 / kb
DO
 IF www < 10 THEN www = www * 10: ee = ee * 10
LOOP UNTIL www > 10
FOR x = 0 TO 620 STEP www
 LINE (10 + x, 225)-STEP(0, 4), 15
NEXT x
LOCATE 1, 1: PRINT "Eine Einheit ="; ee; "kByte."
FOR q = 0 TO kb - 1
 a$ = ""
 FOR x = 0 TO 1023
  a$ = a$ + CHR$(RND * 241 + 14)
  LINE (10 + (620 / (1024 * kb)) * (x + 1024 * q), 230)-STEP(0, 20), 12
 NEXT x
 PRINT #1, a$
NEXT q
CLOSE
LOCATE 20, 8
PRINT "Die erstellte Datei hei·t "; nam$; ", und ist"; kb; "kByte gro·."
LOCATE 23, 18
PRINT "Eine beliebige Taste drÅcken um fortzusetzen."
COLOR 0
DO: LOOP WHILE INKEY$ = ""

