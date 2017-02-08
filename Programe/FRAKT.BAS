CLS

'plant3
's = .85         'x-streckung
'gen = 4         'generationen
'l = 12          'schrittl„nge
'ang = 16        'drehwinkel
'tt$ = "ff-[-f+f+f]+[+f-f-f]"
'x = 0: y = 120  'startposition
'a$ = "f"
'd = 0           'startwinkel

s = 1.25         'x-streckung
gen = 5         'generationen
l = 12          'schrittl„nge
ang = 90        'drehwinkel
f$ = "f"
x$ = "-yf+xfx+fy-"
y$ = "+xf-yfy-fx+"
x = 80: y = 40  'startposition
a$ = "x"
d = 0           'startwinkel



zz = 0
DIM xm(16), ym(16), dm(16)
FOR a = 1 TO gen
 b$ = a$
 a$ = ""
 FOR b = 1 TO LEN(b$)
  SELECT CASE MID$(b$, b, 1)
  CASE "f": a$ = a$ + f$
  CASE "x": a$ = a$ + x$
  CASE "y": a$ = a$ + y$
  CASE ELSE: a$ = a$ + MID$(b$, b, 1)
  END SELECT
 NEXT b
NEXT a

p = 3.141592653# / 180

SCREEN 12
n = l * COS(d * p) * s: m = l * SIN(d * p)
PSET (x, y)
FOR a = 1 TO LEN(a$)
 SELECT CASE MID$(a$, a, 1)
 CASE "f": x = x + n: y = y + m
 CASE "[": xm(zz) = x: ym(zz) = y: dm(zz) = d: zz = zz + 1
 CASE "]": zz = zz - 1: x = xm(zz): y = ym(zz): d = dm(zz): PSET (x, y)
 CASE "-": d = (d + ang) MOD 360: n = l * COS(d * p) * s: m = l * SIN(d * p)
 CASE "+": d = (d - ang + 360) MOD 360: n = l * COS(d * p) * s: m = l * SIN(d * p)
 CASE ELSE
 END SELECT
 LINE -(x, y)
NEXT a

