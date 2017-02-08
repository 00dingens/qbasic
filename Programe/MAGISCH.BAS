ordner$ = "test\"
CLS
DIM z(0) AS INTEGER, i(0) AS STRING * 3
OPEN "c:\eigene~1\rafael\magisch\" + ordner$ + "form.bmp" FOR BINARY AS #1
OPEN "c:\eigene~1\rafael\magisch\" + ordner$ + "muster.bmp" FOR BINARY AS #2
GET #1, 19, z(0)
x1 = z(0)
GET #1, 23, z(0)
y1 = z(0)
GET #2, 19, z(0)
x2 = z(0)
GET #2, 23, z(0)
y2 = z(0)
x3 = x1 + x2
y3 = y1
ap3 = 3 * x3 * y3
l3 = 3 * x3 * y3 + 54
OPEN "c:\eigene~1\rafael\magisch\" + ordner$ + "magisch1.bmp" FOR OUTPUT AS #3
OPEN "c:\eigene~1\rafael\magisch\" + ordner$ + "magisch2.bmp" FOR OUTPUT AS #4
PRINT #3, "BM"; CHR$(l3 MOD 2 ^ 8); CHR$(INT(l3 / 2 ^ 8) MOD 2 ^ 8); CHR$(INT(l3 / 2 ^ 16) MOD 2 ^ 8); CHR$(INT(l3 / 2 ^ 24) MOD 2 ^ 8);
PRINT #3, CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(54); CHR$(0); CHR$(0); CHR$(0); CHR$(40); CHR$(0); CHR$(0); CHR$(0);
PRINT #3, CHR$(x3 MOD 2 ^ 8); CHR$(INT(x3 / 2 ^ 8) MOD 2 ^ 8); CHR$(INT(x3 / 2 ^ 16) MOD 2 ^ 8); CHR$(INT(x3 / 2 ^ 24) MOD 2 ^ 8);
PRINT #3, CHR$(y3 MOD 2 ^ 8); CHR$(INT(y3 / 2 ^ 8) MOD 2 ^ 8); CHR$(INT(y3 / 2 ^ 16) MOD 2 ^ 8); CHR$(INT(y3 / 2 ^ 24) MOD 2 ^ 8);
PRINT #3, CHR$(1); CHR$(0); CHR$(24); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0);
PRINT #3, CHR$(ap3 MOD 2 ^ 8); CHR$(INT(ap3 / 2 ^ 8) MOD 2 ^ 8); CHR$(INT(ap3 / 2 ^ 16) MOD 2 ^ 8); CHR$(INT(ap3 / 2 ^ 24) MOD 2 ^ 8);
PRINT #3, CHR$(196); CHR$(14); CHR$(0); CHR$(0); CHR$(196); CHR$(14);
PRINT #3, CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0);
PRINT #4, "BM"; CHR$(l3 MOD 2 ^ 8); CHR$(INT(l3 / 2 ^ 8) MOD 2 ^ 8); CHR$(INT(l3 / 2 ^ 16) MOD 2 ^ 8); CHR$(INT(l3 / 2 ^ 24) MOD 2 ^ 8);
PRINT #4, CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(54); CHR$(0); CHR$(0); CHR$(0); CHR$(40); CHR$(0); CHR$(0); CHR$(0);
PRINT #4, CHR$(x3 MOD 2 ^ 8); CHR$(INT(x3 / 2 ^ 8) MOD 2 ^ 8); CHR$(INT(x3 / 2 ^ 16) MOD 2 ^ 8); CHR$(INT(x3 / 2 ^ 24) MOD 2 ^ 8);
PRINT #4, CHR$(y3 MOD 2 ^ 8); CHR$(INT(y3 / 2 ^ 8) MOD 2 ^ 8); CHR$(INT(y3 / 2 ^ 16) MOD 2 ^ 8); CHR$(INT(y3 / 2 ^ 24) MOD 2 ^ 8);
PRINT #4, CHR$(1); CHR$(0); CHR$(24); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0);
PRINT #4, CHR$(ap3 MOD 2 ^ 8); CHR$(INT(ap3 / 2 ^ 8) MOD 2 ^ 8); CHR$(INT(ap3 / 2 ^ 16) MOD 2 ^ 8); CHR$(INT(ap3 / 2 ^ 24) MOD 2 ^ 8);
PRINT #4, CHR$(196); CHR$(14); CHR$(0); CHR$(0); CHR$(196); CHR$(14);
PRINT #4, CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0); CHR$(0);
FOR q = 1 TO y3
 FOR w = 1 TO x3
  PRINT #3, CHR$(63) + CHR$(127) + CHR$(255);
 NEXT w
 LOCATE 12, 26: PRINT USING "Bild erstellen: ###% Fertig."; INT(100 * q / y3)
NEXT q
CLOSE
OPEN "c:\eigene~1\rafael\magisch\" + ordner$ + "form.bmp" FOR BINARY AS #1
OPEN "c:\eigene~1\rafael\magisch\" + ordner$ + "muster.bmp" FOR BINARY AS #2
OPEN "c:\eigene~1\rafael\magisch\" + ordner$ + "magisch1.bmp" FOR BINARY AS #3
OPEN "c:\eigene~1\rafael\magisch\" + ordner$ + "magisch2.bmp" FOR BINARY AS #4
FOR y = 0 TO y3 - 1
 ym = y MOD y2
 FOR x = 0 TO x2 - 1
  GET #2, 55 + 3 * (ym * x2 + x), i(0)
  PUT #3, 55 + 3 * (y * x3 + x), i(0)
  PUT #4, 55 + 3 * (y * x3 + x), i(0)
 NEXT x
 FOR x = 0 TO x1 - 1
  GET #1, 55 + 3 * (y * x1 + x), i(0)
  lll = x2 / 3         'maximale Punkth”he    (x2/3 = 1/3 der Musterbreite)
 h1 = INT(ASC(LEFT$(i(0), 1)) * lll / 255)
 h2 = INT((255 - ASC(LEFT$(i(0), 1))) * lll / 255)
  GET #3, 55 + 3 * (y * x3 + x + h1), i(0)
  PUT #3, 55 + 3 * (y * x3 + x2 + x), i(0)
  GET #4, 55 + 3 * (y * x3 + x + h2), i(0)
  PUT #4, 55 + 3 * (y * x3 + x2 + x), i(0)
 NEXT x
 LOCATE 12, 26: PRINT USING "Bild generieren: ###% Fertig."; INT(100 * y / (y3 - 1))
NEXT y
CLOSE
BEEP

