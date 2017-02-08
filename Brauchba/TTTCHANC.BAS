anzeige = 1
DIM q$(-1 TO 1), a(9)
GOSUB null

'GOSUB zuege        'wenn ZÅge angegeben werden sollen
GOSUB zuegeselbst  'wenn ZÅge per Tastatur gemacht werden sollen
'GOSUB position     'wenn Position angegeben wird
                    'nur eine Methode wÑhlen!
zg = 9
FOR tt = 1 TO 9
 IF a(tt) = 0 THEN zg = zg - 1
NEXT tt
IF zg = 0 THEN GOSUB ch0
IF zg <> 0 THEN
 ON zg GOSUB ch1, ch2, ch3, ch4, ch5, ch6, ch7, ch8, ch9
END IF

GOSUB mal
END


zuege:    'Vorbereitungen, falls ZÅge angegeben werden sollen
RESTORE zzz
READ x1, o1, x2, o2, x3, o3, x4, o4, x5
zzz: DATA 1,3,5,9,6,4,8,2,7
GOSUB zulz
IF zu = 0 THEN GOSUB er
GOSUB konvz
GOSUB zulp
IF zu = 0 THEN GOSUB er
RETURN

zuegeselbst:    'Vorbereitungen, falls ZÅge per Tastatur eingetippt werden
LOCATE 1, 1
PRINT "Ziehe mit den Tasten des Num-Blocks. Fertig mit Enter."
LOCATE 10, 37: PRINT " ≥ ≥ "
LOCATE 11, 37: PRINT "ƒ≈ƒ≈ƒ"
LOCATE 12, 37: PRINT " ≥ ≥ "
LOCATE 13, 37: PRINT "ƒ≈ƒ≈ƒ"
LOCATE 14, 37: PRINT " ≥ ≥ "
ff = 0
GOSUB zugeing: IF ff = 0 THEN x1 = zz: PRINT "X" ELSE GOTO weiter1
GOSUB zugeing: IF ff = 0 THEN o1 = zz: PRINT "O" ELSE GOTO weiter1
GOSUB zugeing: IF ff = 0 THEN x2 = zz: PRINT "X" ELSE GOTO weiter1
GOSUB zugeing: IF ff = 0 THEN o2 = zz: PRINT "O" ELSE GOTO weiter1
GOSUB zugeing: IF ff = 0 THEN x3 = zz: PRINT "X" ELSE GOTO weiter1
GOSUB zugeing: IF ff = 0 THEN o3 = zz: PRINT "O" ELSE GOTO weiter1
GOSUB zugeing: IF ff = 0 THEN x4 = zz: PRINT "X" ELSE GOTO weiter1
GOSUB zugeing: IF ff = 0 THEN o4 = zz: PRINT "O" ELSE GOTO weiter1
GOSUB zugeing: IF ff = 0 THEN x5 = zz: PRINT "X" ELSE GOTO weiter1
weiter1:
GOSUB zulz
IF zu = 0 THEN GOSUB er
GOSUB konvz
GOSUB zulp
IF zu = 0 THEN GOSUB er
RETURN

position:    'Vorbereitungen, falls eine Position angegeben werden soll
RESTORE ppp
READ a(1), a(2), a(3), a(4), a(5), a(6), a(7), a(8), a(9)
ppp: DATA -1,1,1,1,-1,-1,1,-1,1
GOSUB zulp
IF zu = 0 THEN GOSUB er
'GOSUB konvp
'GOSUB zulz
'IF zu = 0 THEN GOSUB er
RETURN


null:   'stellt alle Variablen auf 0
CLS
x1 = 0: o1 = 0: x2 = 0: o2 = 0: x3 = 0: o3 = 0: x4 = 0: o4 = 0: x5 = 0
FOR tt = 0 TO 9
 a(tt) = 0
NEXT tt
q$(-1) = "O": q$(0) = " ": q$(1) = "X"
RETURN


zulz:  'testet, ob die ZÅge zulÑssig sind.
zu = 1
IF x1 < 0 OR x1 > 9 OR o1 < 0 OR o1 > 9 OR x2 < 0 OR x2 > 9 OR o2 < 0 OR o2 > 9 OR x3 < 0 OR x3 > 9 OR o3 < 0 OR o3 > 9 OR x4 < 0 OR x4 > 9 OR o4 < 0 OR o4 > 9 OR x5 < 0 OR x5 > 9 THEN zu = 0: RETURN
FOR tt = 1 TO 9
 a(tt) = 0
NEXT tt
a(0) = 0: IF a(x1) = 0 THEN a(x1) = 1 ELSE zu = 0: RETURN
a(0) = 0: IF a(o1) = 0 THEN a(o1) = -1 ELSE zu = 0: RETURN
a(0) = 0: IF a(x2) = 0 THEN a(x2) = 1 ELSE zu = 0: RETURN
a(0) = 0: IF a(o2) = 0 THEN a(o2) = -1 ELSE zu = 0: RETURN
a(0) = 0: IF a(x3) = 0 THEN a(x3) = 1 ELSE zu = 0: RETURN
a(0) = 0: IF a(o3) = 0 THEN a(o3) = -1 ELSE zu = 0: RETURN
a(0) = 0: IF a(x4) = 0 THEN a(x4) = 1 ELSE zu = 0: RETURN
a(0) = 0: IF a(o4) = 0 THEN a(o4) = -1 ELSE zu = 0: RETURN
a(0) = 0: IF a(x5) = 0 THEN a(x5) = 1 ELSE zu = 0: RETURN
RETURN

zulp:   'bestimmt, ob die Position zulÑssig ist.
zu = 1                                           'zulÑssig

'Anzahl der X und O. Wenn X = O oder X = O + 1 dann weiter, sonst zu = 0
a = a(1) + a(2) + a(3) + a(4) + a(5) + a(6) + a(7) + a(8) + a(9)
IF a < 0 OR a > 1 THEN zu = 0: RETURN

'wenn beide gleichzeitig gewinnen, dann zu = 0. gg = Anzahl der Gewinner
gg = 0: ss = 0
IF (a(1) = a(2)) AND (a(1) = a(3)) AND (ss <> a(1)) AND (a(1) <> 0) THEN gg = gg + 1: ss = a(1)
IF (a(4) = a(5)) AND (a(4) = a(6)) AND (ss <> a(4)) AND (a(4) <> 0) THEN gg = gg + 1: ss = a(4)
IF (a(7) = a(8)) AND (a(7) = a(9)) AND (ss <> a(7)) AND (a(7) <> 0) THEN gg = gg + 1: ss = a(7)
IF (a(1) = a(4)) AND (a(1) = a(7)) AND (ss <> a(1)) AND (a(1) <> 0) THEN gg = gg + 1: ss = a(1)
IF (a(2) = a(5)) AND (a(2) = a(8)) AND (ss <> a(2)) AND (a(2) <> 0) THEN gg = gg + 1: ss = a(2)
IF (a(3) = a(6)) AND (a(3) = a(9)) AND (ss <> a(3)) AND (a(3) <> 0) THEN gg = gg + 1: ss = a(3)
IF (a(1) = a(5)) AND (a(1) = a(9)) AND (ss <> a(1)) AND (a(1) <> 0) THEN gg = gg + 1: ss = a(1)
IF (a(3) = a(5)) AND (a(3) = a(7)) AND (ss <> a(3)) AND (a(3) <> 0) THEN gg = gg + 1: ss = a(3)
IF gg > 1 THEN zu = 0: RETURN
RETURN


konvz:   'falls ZÅge vorhanden, aber keine Position.
'Zeichen eintragen
a(x1) = 1: a(o1) = -1: a(x2) = 1: a(o2) = -1: a(x3) = 1: a(o3) = -1: a(x4) = 1: a(o4) = -1: a(x5) = 1: a(0) = 0
'Auf alternative Variablen
'a1 = a(1): a2 = a(2): a3 = a(3): a4 = a(4): a5 = a(5): a6 = a(6): a7 = a(7): a8 = a(8): a9 = a(9)
RETURN

konvp:   'falls Position vorhanden, aber keine ZÅge.
'a(1) = a1: a(2) = a2: a(3) = a3: a(4) = a4: a(5) = a5: a(6) = a6: a(7) = a7: a(8) = a8: a(9) = a9
zg = 9
FOR tt = 1 TO 9
 IF a(tt) = 0 THEN zg = zg - 1
NEXT tt
xx = 0: oo = 0
IF zg = 0 THEN RETURN
DO: xx = xx + 1: IF a(xx) = 1 THEN x1 = xx: EXIT DO
LOOP
IF zg = 1 THEN RETURN
DO: oo = oo + 1: IF a(oo) = -1 THEN o1 = oo: EXIT DO
LOOP
IF zg = 2 THEN RETURN
DO: xx = xx + 1: IF a(xx) = 1 THEN x2 = xx: EXIT DO
LOOP
IF zg = 3 THEN RETURN
DO: oo = oo + 1: IF a(oo) = -1 THEN o2 = oo: EXIT DO
LOOP
IF zg = 4 THEN RETURN
DO: xx = xx + 1: IF a(xx) = 1 THEN x3 = xx: EXIT DO
LOOP
IF zg = 5 THEN RETURN
DO: oo = oo + 1: IF a(oo) = -1 THEN o3 = oo: EXIT DO
LOOP
IF zg = 6 THEN RETURN
DO: xx = xx + 1: IF a(xx) = 1 THEN x4 = xx: EXIT DO
LOOP
IF zg = 7 THEN RETURN
DO: oo = oo + 1: IF a(oo) = -1 THEN o4 = oo: EXIT DO
LOOP
IF zg = 8 THEN RETURN
DO: xx = xx + 1: IF a(xx) = 1 THEN x5 = xx: EXIT DO
LOOP
RETURN

mal:   'gibt Position  und einige Daten aus.
CLS
LOCATE 1, 1: PRINT "ZÅge: "; x1; o1; x2; o2; x3; o3; x4; o4; x5
LOCATE 3, 1: PRINT "Position: "; a(1); a(2); a(3); a(4); a(5); a(6); a(7); a(8); a(9)
LOCATE 5, 1: PRINT USING "Wahrscheinlichkeit, dass X gewinnt: ###.#%"; xg * 100
LOCATE 6, 1: PRINT USING "Wahrscheinlichkeit fÅr unentschieden: ###.#%"; xu * 100
LOCATE 7, 1: PRINT USING "Wahrscheinlichkeit, dass O gewinnt: ###.#%"; xv * 100
LOCATE 10, 37: PRINT q$(a(7)) + "≥" + q$(a(8)) + "≥" + q$(a(9))
LOCATE 11, 37: PRINT "ƒ≈ƒ≈ƒ"
LOCATE 12, 37: PRINT q$(a(4)) + "≥" + q$(a(5)) + "≥" + q$(a(6))
LOCATE 13, 37: PRINT "ƒ≈ƒ≈ƒ"
LOCATE 14, 37: PRINT q$(a(1)) + "≥" + q$(a(2)) + "≥" + q$(a(3))
RETURN

zugeing:  'Hier werden ZÅge per Tastatur eingegeben
zz = 0
DO
 t$ = INKEY$
 SELECT CASE t$
 CASE "1": zz = 1: LOCATE 14, 37
 CASE "2": zz = 2: LOCATE 14, 39
 CASE "3": zz = 3: LOCATE 14, 41
 CASE "4": zz = 4: LOCATE 12, 37
 CASE "5": zz = 5: LOCATE 12, 39
 CASE "6": zz = 6: LOCATE 12, 41
 CASE "7": zz = 7: LOCATE 10, 37
 CASE "8": zz = 8: LOCATE 10, 39
 CASE "9": zz = 9: LOCATE 10, 41
 CASE CHR$(13): ff = 1
 CASE ELSE
 END SELECT
LOOP WHILE t$ = ""
RETURN

ch0: 'Gewinnchance bei Situation nach 0 ZÅgen
xg0 = 0: xu0 = 0: xv0 = 0
FOR t0 = 1 TO 9
 IF anzeige = 1 THEN LOCATE 3, 1: PRINT t0
 a(t0) = 1
 GOSUB ch1
 xg0 = xg0 + xg1: xu0 = xu0 + xu1: xv0 = xv0 + xv1
 a(t0) = 0
NEXT t0
xg0 = xg0 / 9: xu0 = xu0 / 9: xv0 = xv0 / 9
IF zg = 0 THEN xg = xg0: xu = xu0: xv = xv0
RETURN

ch1: 'Gewinnchance bei Situation nach 1 Zug
xg1 = 0: xu1 = 0: xv1 = 0
FOR t1 = 1 TO 9
 IF a(t1) = 0 THEN
  IF anzeige = 1 THEN LOCATE 4, 1: PRINT t1
  a(t1) = -1
  GOSUB ch2
  xg1 = xg1 + xg2: xu1 = xu1 + xu2: xv1 = xv1 + xv2
  a(t1) = 0
 END IF
NEXT t1
xg1 = xg1 / 8: xu1 = xu1 / 8: xv1 = xv1 / 8
IF zg = 1 THEN xg = xg1: xu = xu1: xv = xv1
RETURN

ch2: 'Gewinnchance bei Situation nach 2 ZÅgen
xg2 = 0: xu2 = 0: xv2 = 0
FOR t2 = 1 TO 9
 IF a(t2) = 0 THEN
  IF anzeige = 1 THEN LOCATE 5, 1: PRINT t2
  a(t2) = 1
  GOSUB ch3
  xg2 = xg2 + xg3: xu2 = xu2 + xu3: xv2 = xv2 + xv3
  a(t2) = 0
 END IF
NEXT t2
xg2 = xg2 / 7: xu2 = xu2 / 7: xv2 = xv2 / 7
IF zg = 2 THEN xg = xg2: xu = xu2: xv = xv2
RETURN

ch3: 'Gewinnchance bei Situation nach 3 ZÅgen
xg3 = 0: xu3 = 0: xv3 = 0
FOR t3 = 1 TO 9
 IF a(t3) = 0 THEN
  IF anzeige = 1 THEN LOCATE 6, 1: PRINT t3
  a(t3) = -1
  GOSUB ch4
  xg3 = xg3 + xg4: xu3 = xu3 + xu4: xv3 = xv3 + xv4
  a(t3) = 0
 END IF
NEXT t3
xg3 = xg3 / 6: xu3 = xu3 / 6: xv3 = xv3 / 6
IF zg = 3 THEN xg = xg3: xu = xu3: xv = xv3
RETURN

ch4: 'Gewinnchance bei Situation nach 4 ZÅgen
xg4 = 0: xu4 = 0: xv4 = 0
FOR t4 = 1 TO 9
 IF a(t4) = 0 THEN
  IF anzeige = 1 THEN LOCATE 7, 1: PRINT t4
  a(t4) = 1
  GOSUB ch5
  xg4 = xg4 + xg5: xu4 = xu4 + xu5: xv4 = xv4 + xv5
  a(t4) = 0
 END IF
NEXT t4
xg4 = xg4 / 5: xu4 = xu4 / 5: xv4 = xv4 / 5
IF zg = 4 THEN xg = xg4: xu = xu4: xv = xv4
RETURN

ch5: 'Gewinnchance bei Situation nach 5 ZÅgen
GOSUB gewonnen
xg5 = xg: xu5 = xu: xv5 = xv
IF won = 0 THEN
 FOR t5 = 1 TO 9
  IF a(t5) = 0 THEN
   IF anzeige = 1 THEN LOCATE 8, 1: PRINT t5
   a(t5) = -1
   GOSUB ch6
   xg5 = xg5 + xg6: xu5 = xu5 + xu6: xv5 = xv5 + xv6
   a(t5) = 0
  END IF
 NEXT t5
 xg5 = xg5 / 4: xu5 = xu5 / 4: xv5 = xv5 / 4
END IF
IF zg = 5 THEN xg = xg5: xu = xu5: xv = xv5
RETURN

ch6: 'Gewinnchance bei Situation nach 6 ZÅgen
GOSUB gewonnen
xg6 = xg: xu6 = xu: xv6 = xv
IF won = 0 THEN
 FOR t6 = 1 TO 9
  IF a(t6) = 0 THEN
   IF anzeige = 1 THEN LOCATE 9, 1: PRINT t6
   a(t6) = 1
   GOSUB ch7
   xg6 = xg6 + xg7: xu6 = xu6 + xu7: xv6 = xv6 + xv7
   a(t6) = 0
  END IF
 NEXT t6
 xg6 = xg6 / 3: xu6 = xu6 / 3: xv6 = xv6 / 3
END IF
IF zg = 6 THEN xg = xg6: xu = xu6: xv = xv6
RETURN

ch7: 'Gewinnchance bei Situation nach 7 ZÅgen
GOSUB gewonnen
xg7 = xg: xu7 = xu: xv7 = xv
IF won = 0 THEN
 FOR t7 = 1 TO 9
  IF a(t7) = 0 THEN
   IF anzeige = 1 THEN LOCATE 10, 1: PRINT t7
   a(t7) = -1
   GOSUB ch8
   xg7 = xg7 + xg8: xu7 = xu7 + xu8: xv7 = xv7 + xv8
   a(t7) = 0
  END IF
 NEXT t7
 xg7 = xg7 / 2: xu7 = xu7 / 2: xv7 = xv7 / 2
END IF
IF zg = 7 THEN xg = xg7: xu = xu7: xv = xv7
RETURN

ch8:   'Gewinnchance bei Situation nach 8 ZÅgen
GOSUB gewonnen
xg8 = xg: xu8 = xu: xv8 = xv
IF won = 0 THEN
 FOR t8 = 1 TO 9
  IF a(t8) = 0 THEN
   IF anzeige = 1 THEN LOCATE 11, 1: PRINT t8
   a(t8) = 1
   GOSUB ch9
   xg8 = xg9: xu8 = xu9: xv8 = xv9
   a(t8) = 0
  END IF
 NEXT t8
END IF
IF zg = 8 THEN xg = xg8: xu = xu8: xv = xv8
RETURN

ch9:   'Gewinnchance bei Situation nach 9 ZÅgen
GOSUB gewonnen
IF won = 0 THEN xu = 1
xg9 = xg: xu9 = xu: xv9 = xv
RETURN

gewonnen:
xg = 0: xu = 0: xv = 0
won = 0
r$ = q$(a(1)) + q$(a(2)) + q$(a(3)): GOSUB gew
r$ = q$(a(4)) + q$(a(5)) + q$(a(6)): GOSUB gew
r$ = q$(a(7)) + q$(a(8)) + q$(a(9)): GOSUB gew
r$ = q$(a(1)) + q$(a(4)) + q$(a(7)): GOSUB gew
r$ = q$(a(2)) + q$(a(5)) + q$(a(8)): GOSUB gew
r$ = q$(a(3)) + q$(a(6)) + q$(a(9)): GOSUB gew
r$ = q$(a(1)) + q$(a(5)) + q$(a(9)): GOSUB gew
r$ = q$(a(3)) + q$(a(5)) + q$(a(7)): GOSUB gew
RETURN
gew:  'Falls jemand gewonnen
IF r$ = "XXX" THEN xg = 1: xu = 0: xv = 0: won = 1
IF r$ = "OOO" THEN xg = 0: xu = 0: xv = 1: won = 1
RETURN


er: PRINT "ERROR": END

