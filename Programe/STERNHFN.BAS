RANDOMIZE TIMER
DIM x(2000), y(2000), z(2000)
SCREEN 7, , 0, 1

anz = 200
FOR q = 1 TO anz
 xx = RND * 200 - 100
 yy = RND * 200 - 100
 zz = RND * 200 - 100
 l = SQR((xx * xx) + (yy * yy) + (zz * zz))
 f = (RND * 100) ^ 1
 x(q) = xx * f / l
 y(q) = yy * f / l
 z(q) = zz * f / l
NEXT q

FOR q = 1 TO 7
 OUT &H3C8, q
 OUT &H3C9, 63 - q * 8
 OUT &H3C9, 63 - q * 8
 OUT &H3C9, 63 - q * 8
NEXT q

g = .02
DO
 a = a + RND * g / 5 - g / 10
 b = b + RND * g / 5 - g / 10
 c = c + RND * g / 5 - g / 10
 IF a < -g OR a > g THEN a = SGN(a) * g
 IF b < -g OR b > g THEN b = SGN(b) * g
 IF c < -g OR c > g THEN c = SGN(c) * g


 a1 = SIN(a): a2 = COS(a)
 b1 = SIN(b): b2 = COS(b)
 c1 = SIN(c): c2 = COS(c)

 CLS
 FOR q = 1 TO anz

   yy = y(q) * a2 - z(q) * a1
   zz = y(q) * a1 + z(q) * a2
   y(q) = yy: z(q) = zz
   xx = x(q) * b2 - z(q) * b1
   zz = x(q) * b1 + z(q) * b2
   x(q) = xx: z(q) = zz
   xx = x(q) * c2 - y(q) * c1
   yy = x(q) * c1 + y(q) * c2
   x(q) = xx: y(q) = yy

   'LINE (160 + x(q) * 256 / (z(q) + 256), 100 + y(q) * 256 / (z(q) + 256))-STEP(1, 1), INT((z(q) + 128) / 32), BF
   PSET (160 + x(q) * 256 / (z(q) + 256), 100 + y(q) * 256 / (z(q) + 256)), INT((z(q) + 128) / 32)

 NEXT q
 PCOPY 0, 1
LOOP WHILE INKEY$ = ""

