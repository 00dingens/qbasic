SCREEN 12
PRINT "Dieses Programm fuellt den Speicherplatz einer 1.4 MB Diskette."
OPEN "c:\A" FOR APPEND AS #1
kb = 1400
CLS
LINE (9, 229)-(631, 251), 15, B
FOR x = 0 TO 620 STEP 620 / kb
 LINE (10 + x, 225)-STEP(0, 4), 15
NEXT x
FOR q = 0 TO kb - 1
 a$ = ""
 FOR x = 1 TO 998
  a$ = a$ + CHR$(RND * 223 + 32)
  LINE (10 + (620 / (1000 * kb)) * (x + 1000 * q), 230)-STEP(0, 20), 12
 NEXT x
 PRINT #1, a$
NEXT q
CLOSE
LOCATE 20, 8
PRINT "Die erstellte Datei hei·t "; nam$; ", und ist"; kb; "kByte gro·."
LOCATE 23, 18
PRINT "Eine beliebige Taste drÅcken um fortzusetzen."
COLOR 0

