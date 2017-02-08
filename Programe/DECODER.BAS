'zum texte codieren und decodieren

t$ = "holla, die waldfee"         'template
't$ = "rrffep"         'template
encode = -1              'encodieren=-1 decodieren=0



CLS
t$ = UCASE$(t$)
c$ = t$
PRINT c$
a = 0       'verschiebung
FOR x = 1 TO LEN(t$)
 PRINT x
 IF ASC(MID$(t$, x, 1)) > 64 AND ASC(MID$(t$, x, 1)) < 91 THEN
  IF encode = -1 THEN
   nc = ASC(MID$(t$, x, 1)) + a
   IF nc > 90 THEN nc = nc - 26
   MID$(c$, x, 1) = CHR$(nc)
   a = ASC(MID$(t$, x, 1)) - 65
  ELSE
   nc = ASC(MID$(t$, x, 1)) - a
   IF nc < 65 THEN nc = nc + 26
   MID$(c$, x, 1) = CHR$(nc)
   a = ASC(MID$(c$, x, 1)) - 65
 
  END IF
 END IF
NEXT x
PRINT t$
PRINT c$

