
'Errechnet die Primzahlen bis zur angegebenen Zahl und speichert sie unter
'C:\Eigene Dateien\Rafael\Prim.txt

SCREEN 12
OPEN "C:\Eigene~1\Rafael\Prim.txt" FOR OUTPUT AS #1
grenze = 999999                       'bis hier wird gerechnet.
'zeile = 80                            'maximale Anzahl der Zeichen pro Zeile.
platz = LEN(STR$(grenze))             'benîtigter Platz fÅr eine Zahl.
'anz = INT(zeile / platz)              'Anzahl der Zahlen in einer Reihe.
PRINT #1, "Alle Primzahlen bis"; grenze; ":"
FOR x = 2 TO grenze
 prim = 1
 FOR y = 2 TO INT(SQR(x))
  IF x MOD y = 0 THEN prim = 0
 NEXT y
 IF prim = 1 THEN PRINT #1, RIGHT$(SPACE$(platz) + STR$(x), platz); : aa = aa + 1
 IF x MOD 1000 = 0 THEN LOCATE 12, 33: PRINT USING "###.#% Fertig"; x / grenze * 100: LOCATE 13, 27: PRINT "Insgesamt"; aa; "Primzahlen"
NEXT x
LOCATE 12, 33: PRINT " GANZ Fertig  "
PRINT #1, ""
PRINT #1, "Insgesamt"; aa; "Primzahlen"
LOCATE 13, 27: PRINT "Insgesamt"; aa; "Primzahlen"
CLOSE

