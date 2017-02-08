RANDOMIZE TIMER
CLS
FOR s = 1 TO 20
 a = INT(RND * 1000000000)
 x = 1
 DO
  q = x
  x = CLNG(.5 * (x + a / x))
 LOOP UNTIL x + 1 = q OR x = q OR x - 1 = q
 PRINT x, SQR(a)
NEXT s

