
'ben”tigt eine sounddatei wave1.wav auf desktop. mono 8b 11050Hz

takt = 11050 / 2      '4 takt p sek.
freq = 11050          'wav frequenz = 11050

'a$ = "c1 d1 e1 f1 g1 a1 h1 c2 d2 e2 f2 g2 a2 h2 c3 d3 e3 f3 g3 a3 h3 c4 d4 e4 f4 g4 a4 h4 c5 "
'a$ = "a0 ---a0 h0 ---a0 c1 ---a0 h0 ---a0 a0 ---a0 h0 ---a0 c1 ---a0 h0 ---a0 d1 ---d1 e1 ---d1 f1 ---d1 e1 ---d1 a0 "
a$ = "---a1 ---a1 h1 ---a1 c2 ---a1 h1 ---a1 a1 ---a1 h1 ---a1 c2 ---a1 h1 ---a1 d2 ---d2 e2 ---d2 f2 ---d2 e2 ---d2 d2 d2 d2 "


DIM q(0) AS STRING * 1
OPEN "c:\windows\desktop\wave1.wav" FOR BINARY AS #1
p = 100
s = 1
CLS
PRINT (LEN(a$) / 3) - 1
FOR n = 0 TO (LEN(a$) / 3) - 1
 LOCATE 1, 7: PRINT n
 a0$ = MID$(a$, s, 3)
 s = s + 3
 SELECT CASE a0$
 CASE "c0 ": f = 16.5
 CASE "d0 ": f = 18.5625
 CASE "e0 ": f = 20.625
 CASE "f0 ": f = 22
 CASE "g0 ": f = 24.75
 CASE "a0 ": f = 27.5
 CASE "h0 ": f = 30.9375
 CASE "c1 ": f = 33
 CASE "d1 ": f = 37.125
 CASE "e1 ": f = 41.25
 CASE "f1 ": f = 44
 CASE "g1 ": f = 49.5
 CASE "a1 ": f = 55
 CASE "h1 ": f = 61.875
 CASE "c2 ": f = 66
 CASE "d2 ": f = 74.25
 CASE "e2 ": f = 82.5
 CASE "f2 ": f = 88
 CASE "g2 ": f = 99
 CASE "a2 ": f = 110
 CASE "h2 ": f = 123.75
 CASE "c3 ": f = 132
 CASE "d3 ": f = 148.5
 CASE "e3 ": f = 165
 CASE "f3 ": f = 176
 CASE "g3 ": f = 198
 CASE "a3 ": f = 220
 CASE "h3 ": f = 247.5
 CASE "c4 ": f = 264
 CASE "d4 ": f = 297
 CASE "e4 ": f = 330
 CASE "f4 ": f = 352
 CASE "g4 ": f = 396
 CASE "a4 ": f = 440
 CASE "h4 ": f = 495
 CASE "c5 ": f = 528
 CASE ELSE: f = .001
 END SELECT

 a = freq / f
 FOR x = 1 TO takt
  p = p + 1
  u = (u + 1) MOD a
 
  q(0) = CHR$(INT(256 / a * u))
  PUT #1, p, q(0)
 NEXT x
NEXT n

CLOSE
END

