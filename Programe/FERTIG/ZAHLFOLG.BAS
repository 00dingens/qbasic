CLS
PRINT : PRINT TAB(30); "Zahlen-Senso"
PRINT TAB(29); "______________"
DIM a(30): RANDOMIZE TIMER: n = 1

WHILE NOT f
 a(n) = INT(RND * 10)
 LOCATE 10, 1
 PRINT "Ziffernschlange bis jetzt: "
 FOR j = 1 TO n: PRINT a(j); : NEXT j
 FOR k = 1 TO 2000: NEXT k
 CLS : LOCATE 10, 1
 PRINT "Gib die Ziffernfolge ein!"
 i = 1
 WHILE i <= n AND NOT f
  DO
   z$ = INKEY$
  LOOP WHILE z$ < "0" OR z$ > "9"
  LET zz = VAL(z$)
  PRINT zz;
  IF zz <> a(i) THEN f = -1
  i = i + 1
 WEND
 n = n + 1
WEND
PRINT : PRINT : PRINT "Fehler!"
PRINT "Du konntest dir"; n - 2; " Ziffern merken"

