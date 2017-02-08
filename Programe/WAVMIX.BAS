'schneidet mehrere wavs hintereinander. die wav l„uft jeweils timeX sec
'und wird danach fadeX sec leiser

DEFDBL A-Z
DIM i AS INTEGER
DIM l AS LONG
DIM s50 AS STRING * 50
DIM s1764 AS STRING * 1764   '441*4 = hundertstel sekunde
OPEN "c:\a\a1.wav" FOR BINARY AS #1
OPEN "c:\a\a2.wav" FOR BINARY AS #2
OPEN "c:\a\a3.wav" FOR BINARY AS #3
OPEN "c:\a\output.wav" FOR OUTPUT AS #4
fade1 = 3
fade2 = 2
fade3 = 1
time1 = 88
time2 = 118
time3 = 138

'header erzeugen
GET #1, 1, s50
PRINT #4, s50; CHR$(0);
CLS : PRINT "Lieder schreiben"

'erstes lied schreiben
FOR x = 0 TO 100 * (time1 + fade1) - 1
 GET #1, x * 1764 + 50, s1764
 PRINT #4, s1764;
 'PRINT s1764
 LOCATE 2, 2: PRINT "Song1"; INT(x / (time1 + fade1) + 1); "%"
NEXT x

'zweites lied schreiben
FOR x = 0 TO 100 * (time2 + fade2) - 1
 GET #2, x * 1764 + 50, s1764
 PRINT #4, s1764;
 LOCATE 3, 2: PRINT "Song2"; INT(x / (time2 + fade2) + 1); "%"
NEXT x

'drittes lied schreiben
FOR x = 0 TO 100 * (time3 + fade3) - 1
 GET #3, x * 1764 + 50, s1764
 PRINT #4, s1764;
 LOCATE 4, 2: PRINT "Song3"; INT(x / (time3 + fade3) + 1); "%"
NEXT x

CLOSE
OPEN "c:\a\output.wav" FOR BINARY AS #1

'faden
LOCATE 6, 1: PRINT "Faden"
time = time1
FOR x = 1 TO fade1 * 176400 STEP 2
 GET #1, 50 + time * 176400 + x, i
 i = INT(i * (1 - (x / (fade1 * 176400))))
 PUT #1, 50 + time * 176400 + x, i
 IF x MOD 100 = 1 THEN LOCATE 7, 2: PRINT "Song1"; INT(100 * x / (fade1 * 176400) + 1); "%"
NEXT x
time = time1 + fade1 + time2
FOR x = 1 TO fade2 * 176400 STEP 2
 IF x MOD 100 = 0 THEN PRINT "obacht"
 GET #1, 50 + time * 176400 + x, i
 i = INT(i * (1 - (x / (fade2 * 176400))))
 PUT #1, 50 + time * 176400 + x, i
 IF x MOD 100 = 1 THEN LOCATE 8, 2: PRINT "Song2"; INT(100 * x / (fade2 * 176400) + 1); "%"
NEXT x
time = time1 + fade1 + time2 + fade2 + time3
FOR x = 1 TO fade3 * 176400 STEP 2
 IF x MOD 100 = 0 THEN PRINT "obacht"
 GET #1, 50 + time * 176400 + x, i
 i = INT(i * (1 - (x / (fade3 * 176400))))
 PUT #1, 50 + time * 176400 + x, i
 IF x MOD 100 = 1 THEN LOCATE 9, 2: PRINT "Song3"; INT(100 * x / (fade3 * 176400) + 1); "%"
NEXT x

'l„nge schreiben
l = (time1 + fade1 + time2 + fade2 + time3 + fade3) * 176400 + 42
PUT #1, 5, l
l = l - 36
PUT #1, 41, l
CLOSE
LOCATE 11, 1: PRINT "Fertig"

