fr = 32000      'frequenz-qualit„t zb 44100
gr = 500        'filtergrenze zb 500

DIM i(0) AS STRING * 1
ll = fr / gr
DIM a(0) AS STRING * 5000      'muss >= ll sein
OPEN "c:\windows\desktop\equal.wav" FOR BINARY AS #1
OPEN "c:\windows\desktop\equal1.wav" FOR OUTPUT AS #2
OPEN "c:\windows\desktop\equal2.wav" FOR OUTPUT AS #3
FOR x = 1 TO LOF(1)
 GET #1, x, i(0)
 PRINT #2, i(0);
 PRINT #3, i(0);
NEXT x
CLOSE
OPEN "c:\windows\desktop\equal.wav" FOR BINARY AS #1
OPEN "c:\windows\desktop\equal1.wav" FOR BINARY AS #2
OPEN "c:\windows\desktop\equal2.wav" FOR BINARY AS #3
GET #1, 70, a(0)
s$ = LEFT$(a(0), ll)
FOR x = 70 TO LOF(1)
 GET #1, x + ll, i(0)
 s$ = RIGHT$(s$, ll - 1) + i(0)
 dd = 0
 FOR y = 1 TO ll
  dd = dd + ASC(MID$(s$, y, 1))
 NEXT y
 dd = INT(dd / ll)
 i(0) = CHR$(dd)
 PUT #2, x + INT(ll / 2), i(0)
 GET #1, x + INT(ll / 2), i(0)
 n = ASC(i(0)) - dd + 128
 IF n < 0 THEN n = 0
 IF n > 255 THEN n = 255
 i(0) = CHR$(n)
 PUT #3, x + INT(ll / 2), i(0)
 LOCATE 1, 1: PRINT INT(x * 100 / LOF(1))
NEXT x
CLOSE

