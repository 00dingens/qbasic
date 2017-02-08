
fr = 22050      'frequenz-qualit„t zb 44100
gr = 440        'getestete frequenz

DIM i(0) AS STRING * 1
ll = fr / gr
lll = INT(ll / 2) * 2
llll = lll * 2
DIM a(0) AS STRING * 4000
'kopieren
OPEN "c:\windows\desktop\equal.wav" FOR BINARY AS #1
OPEN "c:\windows\desktop\equal1.wav" FOR OUTPUT AS #2
OPEN "c:\windows\desktop\equal2.wav" FOR OUTPUT AS #3
FOR x = 1 TO LOF(1) - (LOF(1) MOD 4000) STEP 4000
 GET #1, x, a(0)
 PRINT #2, a(0);
 PRINT #3, a(0);
 LOCATE 1, 1: PRINT 100 * x / LOF(1)
NEXT x
FOR x = LOF(1) - (LOF(1) MOD 4000) + 1 TO LOF(1)
 GET #1, x, i(0)
 PRINT #2, i(0);
 PRINT #3, i(0);
 LOCATE 1, 1: PRINT 100 * x / LOF(1)
NEXT x
CLOSE

OPEN "c:\windows\desktop\equal.wav" FOR BINARY AS #1
OPEN "c:\windows\desktop\equal1.wav" FOR BINARY AS #2
OPEN "c:\windows\desktop\equal2.wav" FOR BINARY AS #3
FOR x = 70 + lll TO LOF(1) - lll
 GET #1, x - lll, a(0)
 s$ = LEFT$(a(0), llll)
 dd = 0
 le = LEN(s$)
 le2 = le / 2
 FOR y = 1 TO LEN(s$)
  dd = dd + ASC(MID$(s$, y, 1)) * (le2 - ABS(y - le2))
 NEXT y
 dd = 2 * dd / le2
 dd = INT(dd / LEN(s$))
 i(0) = CHR$(dd)
 PUT #2, x, i(0)
 GET #1, x, i(0)
 n = ASC(i(0)) - dd + 128
 IF n < 0 THEN n = 0
 IF n > 255 THEN n = 255
 i(0) = CHR$(n)
 PUT #3, x, i(0)
 LOCATE 1, 1: PRINT INT(x * 100 / LOF(1))
NEXT x
CLOSE

