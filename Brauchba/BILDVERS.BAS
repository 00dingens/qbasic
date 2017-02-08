
'dieses programm verschl《selt eine datei namens textorig.htm(max 179kb)
'in die datei bild.bmp, oder erzeugt aus bild.bmp die datei text.htm.
'je, nachdem...
'alle dateien sind auf dem desktop.
'�nderungen bleiben vorbehalten

DIM i(0) AS STRING * 1, l(0) AS LONG
CLS
PRINT "Dateien verschl《seln und wieder entschl《seln (v/e)";
INPUT ve$
IF ve$ = "e" THEN GOTO ent:

PRINT "Verschl《seln."
OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\textorig.htm" FOR BINARY AS #2
l(0) = LOF(2)
PRINT "Datei ist"; l(0); "Bytes lang. ";
IF l(0) > 179000 THEN PRINT "Das ist zu lang!" ELSE PRINT
PUT #1, 60, l(0)
FOR x = 1 TO l(0)
 GET #2, x, i(0)
 b = ASC(i(0))
 FOR y = 0 TO 7
  GET #1, 100 + x * 8 + y, i(0)
  bit = (INT(b / (2 ^ y))) MOD 2
  IF ASC(i(0)) MOD 2 = 1 THEN i(0) = CHR$(ASC(i(0)) - 1)
  i(0) = CHR$(ASC(i(0)) + bit)
  PUT #1, 100 + 8 * x + y, i(0)
 NEXT y
 LOCATE 12, 30: PRINT INT(x / l(0) * 100); "% Fertig."
NEXT x

CLOSE
ent:
CLS
PRINT "Entschl《seln."
OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\text.htm" FOR OUTPUT AS #2
GET #1, 60, l(0)
PRINT "Datei wird"; l(0); "Bytes lang sein."
FOR x = 1 TO l(0)
 bit = 0
 FOR y = 0 TO 7
  GET #1, 100 + x * 8 + y, i(0)
  bit = bit + (ASC(i(0)) MOD 2) * 2 ^ y
  IF ASC(i(0)) MOD 2 = 1 THEN i(0) = CHR$(ASC(i(0)) - 1)
 NEXT y
 i(0) = CHR$(bit)
 PRINT #2, i(0);
 LOCATE 12, 30: PRINT INT(x / l(0) * 100); "% Fertig."
NEXT x

CLOSE
END

