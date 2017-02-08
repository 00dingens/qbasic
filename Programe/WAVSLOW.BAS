DEFDBL A-Z
DIM b AS STRING * 1
DIM k AS LONG, l AS LONG
DIM i AS INTEGER
DIM s AS STRING * 50
DIM s10000 AS STRING * 10000
CLS

'beschleunigungsfaktor
factor = 4 / 3

'output dateiname
name$ = "test-1.wav"

OPEN "c:\dokume~1\rafael\desktop\test.wav" FOR BINARY AS #1
OPEN "c:\dokume~1\rafael\desktop\" + name$ FOR OUTPUT AS #2

'neue lÑnge berechnen
GET #1, 5, l
length = INT((l - 40) * factor) + 40

'datei erstellen                          
s10000 = SPACE$(10000)
b = CHR$(0)
FOR x = 1 TO INT(length / 10000)
 PRINT #2, s10000;
 LOCATE 1, 1: PRINT 1000000 * x / length
NEXT x
CLS
FOR x = 1 TO (length MOD 10000) + 8
 PRINT #2, b;
 LOCATE 1, 1: PRINT x;
NEXT x
CLOSE

'jetzt mit daten fÅllen
OPEN "c:\dokume~1\rafael\desktop\test.wav" FOR BINARY AS #1
OPEN "c:\dokume~1\rafael\desktop\" + name$ FOR BINARY AS #2

'dateikopf schreiben
FOR x = 0 TO 12
 GET #1, x * 4 + 1, l
 PUT #2, x * 4 + 1, l
NEXT x

'dateilÑnge schreiben
l = length
PUT #2, 5, l

'SCREEN 12
'neue daten berechnen und schreiben
FOR x = 51 TO length + 8 STEP 2
 kanal = ((x / 2) MOD 2) * 2
 p = x / factor
 gewicht = INT(64 * (p - INT(p)))
 GET #1, INT(p / 4) * 4 + kanal + 1, i
 links = INT(i / 64)
 GET #1, INT(p / 4) * 4 + kanal + 5, i
 rechts = INT(i / 64)
 i = links * (64 - gewicht) + rechts * gewicht
 PUT #2, x, i
 'PSET ((x / 4) MOD 640, i / 256 + 128)
 IF x MOD 10000 = 1 THEN LOCATE 1, 1: PRINT 100 * x / length, i, gewicht
NEXT x

CLOSE
END

