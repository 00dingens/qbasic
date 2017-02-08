'liste fr B2000;0,02(k) B2000;0,05(k) F2000;0,02(k) F2000;0,05(k)

OPEN "c:\windows\desktop\binomial.txt" FOR APPEND AS #1
n = 2000
p = .02
q = 1 - p
PRINT #1, ""
PRINT #1, "n = "; n
PRINT #1, "p = "; p
PRINT #1, " k   B   F"

f = 0
FOR k = 0 TO n

 z = 0
 b = 1
 FOR x = 1 TO k
  'n ber k
  b = b * (n - x + 1) / x
  'mal p hoch k
  b = b * p
  IF b > 100 THEN b = b / 100: z = z + 2
  IF b < .01 THEN b = b * 100: z = z - 2
 NEXT x
 'mal q hoch n-k
 FOR x = 1 TO (n - k)
  b = b * q
  IF b > 100 THEN b = b / 100: z = z + 2
  IF b < .01 THEN b = b * 100: z = z - 2
 NEXT x
 FOR x = 1 TO 100
  IF z > 0 THEN b = b * 100: z = z - 2
  IF z < 0 THEN b = b / 100: z = z + 2
 NEXT x
 f = f + b
 bb$ = RIGHT$("0000" + LTRIM$(STR$(INT(b * 10000.5))), 4)
 ff$ = RIGHT$("0000" + LTRIM$(STR$(INT(f * 10000.5))), 4)
 IF ff$ <> "0000" THEN PRINT #1, k; bb$; " "; ff$
 IF ff$ <> "0000" THEN PRINT k; bb$; " "; ff$
 IF ff$ = "0000" AND f > .9 THEN EXIT FOR

 ''IF k MOD 20 = 0 THEN DO: LOOP WHILE INKEY$ = ""
NEXT k
PRINT #1, ""
CLOSE

