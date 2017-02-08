RANDOMIZE TIMER
DIM a(200), b(200), d(200)     'pos, richtg, dauer
aufl = 2                 'auflîsung: 1=schlecht;2=gut
abmin = 10                'minimale abschnittslÑnge
abmax = 30                'maximale abschnittslÑnge
vzh = .2                 'verzweigungshÑufigkeit
krz = 0                  'dÅrfen sie sich kreuzen? 1=ja 0=nein
sch = 2                  'maximale seitwÑrtsbewegung
blz = 3                  'maximale blitzanzahl (auf einmal)
b0 = 15: b1 = 7: b2 = 0  'farben (von innen nach aussen)


IF aufl = 1 THEN SCREEN 7, , 0, 1 ELSE SCREEN 9, , 0, 1
abmax = abmax - abmin
IF aufl = 1 THEN yw = 200 ELSE yw = 350
DO
 CLS
 anz = INT(RND * blz + 1)   'anzahl der starts
 FOR x = 1 TO anz                   '\
  a(x) = RND * 640                  ' \ startpositionen
  IF aufl = 1 THEN a(x) = a(x) / 2  ' /
 NEXT x                             '/
 FOR x = 1 TO yw       'zeilenweise runtergehen
  FOR i = 1 TO anz      'punkte durchgehen
   IF d(i) = 0 THEN
    d(i) = INT(RND * abmax + abmin)        'lÑnge des neuen abschnitts
    b(i) = RND * sch * 2 - sch             'richtung des neuen abschnitts
    IF RND < vzh THEN
     anz = anz + 1
     a(anz) = a(i)
     b(anz) = RND * sch * 2 - sch
     d(anz) = INT(RND * abmax + abmin)
    END IF
   END IF
   rr = CINT(b(i))
   IF SGN(rr) = 1 THEN rr1 = rr: rr2 = 0 ELSE rr1 = 0: rr2 = rr
   IF b2 <> 0 THEN PSET (a(i) + rr2 - 2, x), b2: PSET (a(i) + rr1 + 2, x), b2
   IF b1 <> 0 THEN PSET (a(i) + rr2 - 1, x), b1: PSET (a(i) + rr1 + 1, x), b1
   LINE (a(i), x)-STEP(rr, 0), b0
   a(i) = a(i) + b(i): d(i) = d(i) - 1
  NEXT i
  FOR i = 1 TO anz - 1
   FOR o = i + 1 TO anz
    'wenn sie sich kreuzen->vereinen
    IF SGN(a(i) - a(o)) <> SGN(a(i) + b(i) - a(o) - b(o)) AND krz = 0 THEN
     a(o) = a(anz)
     b(o) = b(anz)
     d(o) = d(anz)
     anz = anz - 1
     d(i) = 0
    END IF
   NEXT o
  NEXT i
 NEXT x
t = TIMER
PCOPY 0, 1
'DO: LOOP UNTIL TIMER > t + .3 'dauer des blizes
CLS
'PCOPY 0, 1
'''DO: LOOP UNTIL TIMER > t + 1 'dauer der dunkelheit

LOOP WHILE INKEY$ = ""



