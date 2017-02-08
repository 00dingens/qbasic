RANDOMIZE TIMER
SCREEN 7, , 0, 1

xd = 0: yd = 0: zd = 0

g = 150    'ausdehnung
ab = 50    'abstand
spd = 1    'geschwindigkeit
e = 300    'entfernung vom schirm
en = g * 2 'entfernung der punktemitte vom mensch
dr = .002   'drehung

rep = 0
WINDOW (-160, -100)-(159, 99)
DO
 CLS
 rep = (rep + spd) MOD ab

 xd = xd + RND * dr - dr / 2
 IF xd > dr * 5 THEN xd = dr * 5
 IF xd < -dr * 5 THEN xd = -dr * 5
 xd0 = xd0 + xd
 xd1 = SIN(xd0): xd2 = COS(xd0)

 yd = yd + RND * dr - dr / 2
 IF yd > dr * 5 THEN yd = dr * 5
 IF yd < -dr * 5 THEN yd = -dr * 5
 yd0 = yd0 + yd
 yd1 = SIN(yd0): yd2 = COS(yd0)

 zd = zd + RND * dr - dr / 2
 IF zd > dr * 5 THEN zd = dr * 5
 IF zd < -dr * 5 THEN zd = -dr * 5
 zd0 = zd0 + zd
 zd1 = SIN(zd0): zd2 = COS(zd0)

 FOR x = -g TO g STEP ab
  FOR y = -g TO g STEP ab
   FOR z = -g + rep TO g STEP ab
    xx = x: yy = y: zz = z
   
    yyy = yy * xd2 - zz * xd1
    zzz = yy * xd1 + zz * xd2
    yy = yyy: zz = zzz

    xxx = xx * yd2 - zz * yd1
    zzz = xx * yd1 + zz * yd2
    xx = xxx: zz = zzz

    xxx = xx * zd2 - yy * zd1
    yyy = xx * zd1 + yy * zd2
    xx = xxx: yy = yyy

    PSET ((xx * e / (zz + en)), (yy * e / (zz + en)))
   NEXT z
  NEXT y
 NEXT x
 PCOPY 0, 1
LOOP WHILE INKEY$ = ""

