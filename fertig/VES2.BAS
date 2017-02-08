ON ERROR GOTO er
CLS
DIM i(0) AS STRING * 1
d1$ = "c:\vesdemo\test.txt"           'Quelldatei
d2$ = "c:\vesdemo\test1.txt"          'Zieldatei
v = 1                                 '1 - VerschlÅsseln;  2 - EntschlÅsseln
p$ = " Fetz ab! "                 'Passwort
ue = 0                                'wenn ue = 1 dann wird die Zieldatei
                                      'Åberschrieben, falls vorhanden.

e = 0
OPEN d1$ FOR INPUT AS #1
CLOSE
IF e = 1 THEN COLOR 28: PRINT "Quelldatei existiert nicht!": GOTO bye       ''
COLOR 8: PRINT "Quelldatei existiert."                                      ''
e = 0
OPEN d2$ FOR INPUT AS #1
CLOSE
IF e = 0 AND ue = 0 THEN COLOR 28: PRINT "Zieldatei existiert!": GOTO bye   ''
IF e = 1 THEN COLOR 8: PRINT "Zieldatei existierte nicht, wird erzeugt."    ''
IF e = 0 THEN COLOR 8: PRINT "Zieldatei existiert, wird Åberschrieben."     ''
OPEN d1$ FOR BINARY AS #1
OPEN d2$ FOR OUTPUT AS #2
FOR x = 1 TO LOF(1)
 PRINT #2, CHR$(0);
NEXT x
CLOSE 2
OPEN d2$ FOR BINARY AS #2
PRINT "Quelldatei ist "; LOF(1); " Bytes gross, Zieldatei"; LOF(2); " Bytes."
FOR x = 1 TO LOF(1)
 ss = ss MOD LEN(p$) + 1
 GET #1, x, i(0)
 IF v = 1 THEN
  i(0) = CHR$((ASC(i(0)) + ASC(MID$(p$, ss, 1))) MOD 256)
 ELSE
  i(0) = CHR$((ASC(i(0)) - ASC(MID$(p$, ss, 1)) + 256) MOD 256)
 END IF
 PUT #2, x, i(0)
 LOCATE 7, 10: COLOR 15: PRINT USING "###% Fertig."; INT(x / LOF(1) * 100)
NEXT x
CLOSE
LOCATE 7, 10: COLOR 15: PRINT "Ganz Fertig."
PRINT : PRINT : PRINT : PRINT

bye: COLOR 7: PRINT "Programm beendet.": COLOR 23: END
er: ee = 1: RESUME NEXT

