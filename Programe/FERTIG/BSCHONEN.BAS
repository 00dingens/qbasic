DIM t%(10000)
RANDOMIZE TIMER
CLS
INPUT "Wie soll der Text lauten?"; q$
SCREEN 12
LOCATE 2, 2
PRINT q$
a = LEN(q$) * 8
GET (7, 15)-(9 + a, 33), t%
x = 220: y = 140
PUT (x, y), t%, PSET
n = RND * 2 - 1
m = RND * 2 - 1
IF n * m = 0 THEN n = 1
CLS
DO
 PUT (x, y), t%, PSET
 x = x + n: y = y + m
 IF x < 10 THEN n = RND * .5 + .5
 IF x + a > 630 THEN n = -(RND * .5 + .5)
 IF y < 10 THEN m = RND * .5 + .5
 IF y > 455 THEN m = -(RND * .5 + .5)
LOOP WHILE INKEY$ = ""

