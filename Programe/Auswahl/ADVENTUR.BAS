
'Textadventure zum selbstbasteln (nur die Sachen in den DATA-Zeilen brauchen
'ver�ndert werden.

sit = 200: zei = 10: moe = 10
'[sit] ist die maximale Anzahl der Situationen.
'[zei] ist die maximale Anzahl der Zeilen pro Situation.
'[moe] ist die maximale Anzahl der Verzweigungsm�glichkeiten pro Situation,
'      dabei muss [moe] gr��er oder gleich [zei] sein!

DIM a$(sit, zei), a(sit, 1, moe)
'[a$()]           :Hier wird der Text hineingeschrieben.
'[a(..., 0, ...)] :Hier werden die Farben aufbewahrt.
'[a(..., 1, ...)] :Hier werden die M�glichkeiten hineingeschrieben.

READ a(0, 0, 0)
'in [a(0, 0, 0)] wird die tats�chliche Anzahl der Situationen gespeichert.
FOR x = 1 TO a(0, 0, 0)
 READ a(x, 1, 0)
 '[a(x, 1, 0)] bewahrt die Anzahl der M�glichkeiten f�r Situation Nr. x auf.
 FOR y = 1 TO a(x, 1, 0)
  READ a(x, 1, y)
  '[a(x, 1, y)] enth�lt die Verzweigungsrichtung Nr. y f�r Situation Nr. x.
 NEXT y
 READ a(x, 0, 0), far
 '[a(x, 0, 0)] ist die Anzahl der Zeilen der Situation Nr. x.
 'in [far] wird gespeichert, ob die Zeilen farbig oder wei� sind.
 FOR y = 1 TO a(x, 0, 0)
  IF far <> 0 THEN READ a(x, 0, y)
  READ a$(x, y)
  'in [a$(x, y)] steht die Zeile Nr. y der Situation Nr. x,
  'und in [a(x, 0, y)] ihre Farbe.
 NEXT y
NEXT x
'Hier endet das Einlesen der Variablen, das eigentliche Programm beginnt!
CLS : s = 1
'Bildschirm l�schen
'[s] ist die aktuelle Situation
LOCATE 19, 1
DO
 x = s
 FOR y = 1 TO a(x, 0, 0)
  IF a(x, 0, y) = 0 THEN COLOR 15 ELSE COLOR a(x, 0, y)
  'Farbe bestimmen
  PRINT a$(x, y)
  'Zeile ausgeben
 NEXT y
 IF a(x, 1, 0) <> 0 THEN
  COLOR 8
  PRINT : PRINT "M�glichkeit(en):";
  FOR y = 1 TO a(x, 1, 0)
   PRINT y;
  NEXT y
  PRINT : PRINT "Deine Wahl"
  DO
   LOCATE 23, 12: PRINT SPACE$(60)
   LOCATE 23, 12: INPUT q
  LOOP UNTIL q > 0 AND q <= a(x, 1, 0)
  s = a(x, 1, q)
 ELSE : END
 END IF
 PRINT : PRINT : PRINT
LOOP


DATA 2
'Hier steht die Anzahl der Situationen.

DATA 2, 1,2
'Die erste Zahl gibt die Anahl der Verzweigungsm�glichkeiten dieser Situation
'an, die Folgenden die Situationen zu denen verzweigt wird.
DATA 3,1
'Anzahl der Zeilen dieser Situation,
'die 2. Zahl: 1 = Farbe einlesen  0 = keine Farbe einlesen
DATA  9, Guten Tag!
DATA 10, Guten Tag ebenfalls!
DATA  9, Willst du bleiben oder dich verabschieden?
'jeweils Farbe der Zeile (sofern oben 1 eingegeben wurde), Text der Zeile.
'wenn oben bei der Farbeinlesvariable 0 eingegeben wurde, darf hier keine
'Zahl f�r die Farbe stehen!

DATA 0
'Wenn bei dieser Situation das Programm enden soll gib hier 0 ein
DATA 3,1
'siehe oben
DATA  9, Tsch�ss!
DATA 10, Tsch�ss ebenfalls!
DATA  9, Bis zum N�chstenmal!
'siehe auch oben

