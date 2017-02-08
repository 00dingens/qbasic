
'Dateien Ver- und entschl《seler

Men:
 CLEAR
 ON ERROR GOTO Er
 DIM q(0) AS STRING * 1
 CLS
 PRINT
 PRINT TAB(27); "Verschl《seler von Rafael"
 PRINT TAB(26); "ﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟ"
 PRINT : PRINT : PRINT
 PRINT TAB(33); CHR$(26) + " Verschl《seln"
 PRINT TAB(35); "Entschl《seln"
 PRINT TAB(35); "Ende"

MenVer:
 DO: t$ = INKEY$: LOOP UNTIL t$ = CHR$(13) OR t$ = CHR$(0) + "P"
 IF t$ = CHR$(0) + "P" THEN LOCATE 7, 33: PRINT " ": LOCATE 8, 33: PRINT CHR$(26): GOTO MenEnt
 GOTO Ver

MenEnt:
 DO: t$ = INKEY$: LOOP UNTIL t$ = CHR$(13) OR t$ = CHR$(0) + "H" OR t$ = CHR$(0) + "P"
 IF t$ = CHR$(0) + "H" THEN LOCATE 8, 33: PRINT " ": LOCATE 7, 33: PRINT CHR$(26): GOTO MenVer
 IF t$ = CHR$(0) + "P" THEN LOCATE 8, 33: PRINT " ": LOCATE 9, 33: PRINT CHR$(26): GOTO MenEnd
 GOTO Ent

MenEnd:
 DO: t$ = INKEY$: LOOP UNTIL t$ = CHR$(13) OR t$ = CHR$(0) + "H"
 IF t$ = CHR$(0) + "H" THEN LOCATE 9, 33: PRINT " ": LOCATE 8, 33: PRINT CHR$(26): GOTO MenEnt
 GOTO Ende

Ver:
 CLS
 PRINT
 PRINT TAB(34); "Verschl《seln"
 PRINT TAB(33); "ﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟ"
 PRINT : PRINT : PRINT
 PRINT TAB(15); "Welche Datei (mit Pfad) soll verschl《selt werden?"
 LOCATE 9, 10: INPUT Dat1$
 IF Dat1$ = "" THEN GOTO Men
 Eror = 0
 OPEN Dat1$ FOR INPUT AS #1
 IF Eror = 1 THEN LOCATE 11, 10: PRINT "Datei existiert nicht!": DO: LOOP WHILE INKEY$ = "": GOTO Ver
 CLOSE
 DO
  LOCATE 11, 4
  INPUT "Soll Methode [1], Methode [2] oder ein Passwort [3] verwendet werden"; met
 LOOP UNTIL met = 1 OR met = 2 OR met = 3
Aa1:
 LOCATE 12, 15
 PRINT "Wie soll die verschl《selte Datei (mit Pfad) hei疇n?"
 LOCATE 13, 10: INPUT Dat2$
 IF Dat2$ = "" THEN GOTO Men
 Eror = 0
 OPEN Dat2$ FOR INPUT AS #1
 t$ = ""
 IF Eror = 0 THEN LOCATE 15, 10: PRINT "Datei existiert! 喘erschreiben (j/n)?": DO: t$ = INKEY$: LOOP UNTIL t$ = "j" OR t$ = "n"
 CLOSE
 IF t$ = "n" THEN
  LOCATE 13, 1: PRINT SPACE$(79): LOCATE 15, 1: PRINT SPACE$(79): GOTO Aa1
 END IF
 IF met = 3 THEN DO: LOCATE 15, 10: INPUT "Passwort"; pas$: LOOP UNTIL LEN(pas$) < 61 AND LEN(pas$) > 0
 LOCATE 15, 1
 IF met <> 3 THEN
  PRINT Dat1$; " wird mit Methode"; met; "verschl《selt und in "; Dat2$; " gespeichert."
 ELSE
  PRINT Dat1$; " wird mit Passwort "; pas$; " verschl《selt und in "; Dat2$; " gespeichert."
 END IF
 LOCATE 17, 1
 PRINT "ﾉﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍｻ"
 PRINT "ｺ                                                                              ｺ"
 PRINT "ﾈﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍｼ"
 SELECT CASE met
 CASE 1
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR OUTPUT AS #2
  ll = LOF(1)
  FOR x = 1 TO ll + 1: PRINT #2, " "; : NEXT x
  CLOSE
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR BINARY AS #2
  q(0) = "1": PUT #2, 1, q(0)
  FOR x = 1 TO ll
   GET #1, x, q(0)
   q(0) = CHR$((ASC(q(0)) + 1) MOD 256)
   PUT #2, x + 1, q(0)
   LOCATE 18, 2 + (76 / ll) * x: PRINT "ﾛ"
  NEXT x
 CASE 2
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR OUTPUT AS #2
  ll = LOF(1)
  FOR x = 1 TO ll + 2: PRINT #2, " "; : NEXT x
  CLOSE
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR BINARY AS #2
  q(0) = "2": PUT #2, 1, q(0)
  q(0) = CHR$(INT(RND * 255 + 1)): PUT #2, 2, q(0)
  z1 = ASC(q(0))
  FOR x = 1 TO ll
   GET #1, x, q(0)
   z2 = ASC(q(0))
   q(0) = CHR$((z1 + z2) MOD 256)
   PUT #2, x + 2, q(0)
   z1 = z2
   LOCATE 18, 2 + (76 / ll) * x: PRINT "ﾛ"
  NEXT x
 CASE 3
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR OUTPUT AS #2
  ll = LOF(1)
  FOR x = 1 TO ll + 2 + LEN(pas$): PRINT #2, " "; : NEXT x
  CLOSE
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR BINARY AS #2
  q(0) = "3": PUT #2, 1, q(0)
  q(0) = CHR$(LEN(pas$)): PUT #2, 2, q(0)
  FOR x = 1 TO LEN(pas$)
   q(0) = MID$(pas$, x, 1)
   PUT #2, 2 + x, q(0)
  NEXT x
  FOR x = 1 TO ll
   pp = (pp MOD LEN(pas$)) + 1
   GET #1, x, q(0)
   q(0) = CHR$((ASC(q(0)) + ASC(MID$(pas$, pp, 1))) MOD 256)
   PUT #2, x + 2 + LEN(pas$), q(0)
   LOCATE 18, 2 + (76 / ll) * x: PRINT "ﾛ"
  NEXT x
 CASE ELSE
 END SELECT
 LOCATE 21, 10: PRINT "Fertig! Bitte Taste dr…ken!": DO: LOOP WHILE INKEY$ = ""
 GOTO Men

Ent:
 CLS
 PRINT
 PRINT TAB(34); "Entschl《seln"
 PRINT TAB(33); "ﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟﾟ"
 PRINT : PRINT : PRINT
 PRINT TAB(15); "Welche Datei (mit Pfad) soll Entschl《selt werden?"
 LOCATE 9, 10: INPUT Dat1$
 IF Dat1$ = "" THEN GOTO Men
 Eror = 0
 OPEN Dat1$ FOR INPUT AS #1
 IF Eror = 1 THEN LOCATE 11, 10: PRINT "Datei existiert nicht!": DO: LOOP WHILE INKEY$ = "": GOTO Ver
 CLOSE
Aa2:
 LOCATE 11, 15
 PRINT "Wie soll die entschl《selte Datei (mit Pfad) hei疇n?"
 LOCATE 12, 10: INPUT Dat2$
 IF Dat2$ = "" THEN GOTO Men
 Eror = 0
 OPEN Dat2$ FOR INPUT AS #1
 t$ = ""
 IF Eror = 0 THEN LOCATE 14, 10: PRINT "Datei existiert! 喘erschreiben (j/n)?": DO: t$ = INKEY$: LOOP UNTIL t$ = "j" OR t$ = "n"
 CLOSE
 IF t$ = "n" THEN
  LOCATE 12, 1: PRINT SPACE$(79): LOCATE 14, 1: PRINT SPACE$(79): GOTO Aa2
 END IF
 OPEN Dat1$ FOR BINARY AS #1
 GET #1, 1, q(0)
 w$ = q(0)
 SELECT CASE w$
 CASE "1": met = 1
 CASE "2": met = 2
 CASE "3": met = 3
  GET #1, 2, q(0)
  e = ASC(q(0))
  FOR x = 1 TO e
   GET #1, 2 + x, q(0)
   pasri$ = pasri$ + q(0)
  NEXT x
  DO
   LOCATE 14, 10: PRINT SPACE$(69)
   LOCATE 14, 10: INPUT "Passwort"; pas$
   IF LEN(pas$) = 0 THEN GOTO Men
  LOOP UNTIL pas$ = pasri$
 CASE ELSE: GOTO Men
 END SELECT
 CLOSE
 LOCATE 14, 1
 IF met <> 3 THEN
  PRINT Dat1$; " wird mit Methode"; met; "entschl《selt und in "; Dat2$; " gespeichert."
 ELSE
  PRINT Dat1$; " wird mit Passwort "; pas$; " entschl《selt und in "; Dat2$; " gespeichert."
 END IF
 LOCATE 17, 1
 PRINT "ﾉﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍｻ"
 PRINT "ｺ                                                                              ｺ"
 PRINT "ﾈﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍｼ"
 SELECT CASE met
 CASE 1
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR OUTPUT AS #2
  ll = LOF(1) - 1
  FOR x = 1 TO ll: PRINT #2, " "; : NEXT x
  CLOSE
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR BINARY AS #2
  FOR x = 1 TO ll
   GET #1, x + 1, q(0)
   q(0) = CHR$((ASC(q(0)) + 255) MOD 256)
   PUT #2, x, q(0)
   LOCATE 18, 2 + (76 / ll) * x: PRINT "ﾛ"
  NEXT x
 CASE 2
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR OUTPUT AS #2
  ll = LOF(1) - 2
  FOR x = 1 TO ll: PRINT #2, " "; : NEXT x
  CLOSE
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR BINARY AS #2
  GET #1, 2, q(0)
  z1 = ASC(q(0))
  FOR x = 1 TO ll
   GET #1, x + 2, q(0)
   z2 = ASC(q(0))
   q(0) = CHR$((z2 - z1 + 256) MOD 256)
   PUT #2, x, q(0)
   z1 = (z2 - z1 + 256) MOD 256
   LOCATE 18, 2 + (76 / ll) * x: PRINT "ﾛ"
  NEXT x
 CASE 3
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR OUTPUT AS #2
  ll = LOF(1) - 2 - LEN(pas$)
  FOR x = 1 TO ll: PRINT #2, " "; : NEXT x
  CLOSE
  OPEN Dat1$ FOR BINARY AS #1
  OPEN Dat2$ FOR BINARY AS #2
  FOR x = 1 TO ll
   pp = (pp MOD LEN(pas$)) + 1
   GET #1, x + 2 + LEN(pas$), q(0)
   q(0) = CHR$((ASC(q(0)) - ASC(MID$(pas$, pp, 1)) + 256) MOD 256)
   PUT #2, x, q(0)
   LOCATE 18, 2 + (76 / ll) * x: PRINT "ﾛ"
  NEXT x
 CASE ELSE
 END SELECT
 LOCATE 21, 10: PRINT "Fertig! Bitte Taste dr…ken!": DO: LOOP WHILE INKEY$ = ""
 GOTO Men

Ende:
 LOCATE 12, 29: PRINT "Wirklich beenden (j/n)?"
 DO: t$ = INKEY$: LOOP UNTIL t$ = "j" OR t$ = "n"
 IF t$ = "j" THEN END
 GOTO Men

Er:
 Eror = 1
RESUME NEXT

