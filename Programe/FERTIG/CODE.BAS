ON ERROR GOTO 100
DIM q(0) AS STRING * 1
CLS
LOCATE 2, 28: PRINT "Ver- und Entschl《seler"
LOCATE 3, 35: PRINT "von Rafael"
LOCATE 5, 13: PRINT "Willst du eine Datei ent- oder verschl《seln (E, V)? ";
DO: t$ = UCASE$(INKEY$): LOOP UNTIL t$ = "V" OR t$ = "E"
COLOR 12: LOCATE 5, 64: PRINT " " + t$: COLOR 7
LOCATE 7, 8
IF t$ = "E" THEN PRINT "Welche Datei m把htest du Entschl《seln (Mit Pfad)";
IF t$ = "V" THEN PRINT "Welche Datei m把htest du Verschl《seln (Mit Pfad)";
INPUT Datei$
COLOR 12: LOCATE 7, 57: PRINT " " + Datei$ + "  ": COLOR 7
Datneu$ = Datei$
IF t$ = "V" THEN
 MID$(Datneu$, LEN(Datei$), 1) = CHR$((ASC(MID$(Datneu$, LEN(Datei$), 1)) + 1) MOD 256)
 OPEN Datei$ FOR BINARY AS #1
 OPEN Datneu$ FOR OUTPUT AS #2
 FOR x = 1 TO LOF(1): PRINT #2, " "; : NEXT x
 CLOSE 2
 OPEN Datneu$ FOR BINARY AS #2
 LOCATE 17, 5: PRINT Datei$ + " wird nach " + Datneu$ + " verschl《selt."
 LOCATE 19, 14: PRINT "ﾉﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍｻ"
 LOCATE 20, 14: PRINT "ｺ                                                   ｺ"
 LOCATE 21, 14: PRINT "ﾈﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍｼ"
 COLOR 9
 FOR x = 1 TO LOF(1)
  GET 1, x, q(0)
  q(0) = CHR$((ASC(q(0)) + 1) MOD 256)
  PUT 2, x, q(0)
  LOCATE 20, 15 + INT(x / LOF(1) * 50): PRINT "ﾛ"
 NEXT x
 COLOR 7
END IF
IF t$ = "E" THEN
 MID$(Datneu$, LEN(Datei$), 1) = CHR$((ASC(MID$(Datneu$, LEN(Datei$), 1)) + 255) MOD 256)
 OPEN Datei$ FOR BINARY AS #1
 OPEN Datneu$ FOR OUTPUT AS #2
 FOR x = 1 TO LOF(1): PRINT #2, " "; : NEXT x
 CLOSE 2
 OPEN Datneu$ FOR BINARY AS #2
 LOCATE 17, 5: PRINT Datei$ + " wird nach " + Datneu$ + " entschl《selt."
 LOCATE 19, 14: PRINT "ﾉﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍｻ"
 LOCATE 20, 14: PRINT "ｺ                                                   ｺ"
 LOCATE 21, 14: PRINT "ﾈﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍﾍｼ"
 COLOR 9
 FOR x = 1 TO LOF(1)
  GET 1, x, q(0)
  q(0) = CHR$((ASC(q(0)) + 255) MOD 256)
  PUT 2, x, q(0)
  LOCATE 20, 15 + INT(x / LOF(1) * 50): PRINT "ﾛ"
 NEXT x
 COLOR 7
END IF
PRINT : PRINT "Neue Datei:" + Datneu$
CLOSE
END

100 :
COLOR 28: PRINT "FEHLER AUFGETRETEN! Fragen an Rafael.": COLOR 7
CLOSE
END

