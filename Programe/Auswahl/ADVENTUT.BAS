
'Fertiges Adventure Ende mit 0

sit = 200: zei = 10: moe = 10
DIM a$(sit, zei), a(sit, 1, moe)
READ a(0, 0, 0)
FOR x = 1 TO a(0, 0, 0)
 READ a(x, 1, 0)
 FOR y = 1 TO a(x, 1, 0)
  READ a(x, 1, y)
 NEXT y
 READ a(x, 0, 0), far
 FOR y = 1 TO a(x, 0, 0)
  IF far <> 0 THEN READ a(x, 0, y)
  READ a$(x, y)
 NEXT y
NEXT x
CLS : s = 1
LOCATE 19, 1
DO
 x = s
 FOR y = 1 TO a(x, 0, 0)
  IF a(x, 0, y) = 0 THEN COLOR 15 ELSE COLOR a(x, 0, y)
  PRINT a$(x, y)
 NEXT y
 IF a(x, 1, 0) <> 0 THEN
  COLOR 8
  PRINT : PRINT "M”glichkeit(en):";
  FOR y = 1 TO a(x, 1, 0)
   PRINT y;
  NEXT y
  PRINT : PRINT "Deine Wahl"
  DO
   LOCATE 23, 12: PRINT SPACE$(60)
   LOCATE 23, 12: INPUT q
  LOOP UNTIL q >= 0 AND q <= a(x, 1, 0)
  IF q = 0 THEN COLOR 20: PRINT "E N D E": END
  s = a(x, 1, q)
 ELSE : END
 END IF
 PRINT : PRINT : PRINT
LOOP


DATA 20

'1
DATA 2, 3,2
DATA 6,1
DATA 15, "       TEXT ADVENTURE"
DATA 15, "   Written by: Rafael Friesen"
DATA 15, "   Tested by: Naemi Friesen"
DATA 15, "Dies ist ein Labyrinth. Jeder Raum hat seine eigene Farbe."
DATA 15, "Du befindest dich in einem Fahrstuhl. Die Tr ist offen. Willst du den"
DATA 15, "Fahrstuhl verlassen (1), oder mit ihm in ein anderes Stockwerk fahren (2)?"
'2
DATA 0
DATA 2,1
DATA  4, "Leider gibt es keine anderen Stockwerke. Der Fahrstuhl berhitzt sich"
DATA  4, "und Explodiert. Das wars!"
'3
DATA 3, 4,5,6
DATA 2,1
DATA  1, "Du stehst mit dem Rcken zum Fahrstuhl. Willst du wieder in den Fahrstuhl"
DATA  1, "zurck (1), durch die Tr links (2), oder geradeaus duch den Durchgang (3)?"
'4
DATA 1, 3
DATA 1,1
DATA 12, "Die Schiebetr ist zu, und du kannst nicht in den Fahrstuhl. Umdrehen mit (1)."
'5
DATA 1, 17
DATA 1,1
DATA 12, "Diese Tr l„sst sich nur von der anderen Seite ”ffnen. Du drehst dich um (1)"
'6
DATA 3, 7,8,9
DATA 2,1
DATA  2, "Du stehst in einem ganz grnen Raum. Willst du zurck durch den Durchgang (1),"
DATA  2, "oder geradeaus (2). Oder willst du doch lieber nach links (3)?"
'7
DATA 3, 6,4,5
DATA 2,1
DATA  1, "In dem Raum, den du mit (1) wieder verlassen kannst, siehst du vor dir einen"
DATA  1, "Fahrstuhl. Willst du ihn betreten (2), oder durch die Tr rechts gehen (3)?"
'8
DATA 1, 15
DATA 1,1
DATA 12, "Diese Tr l„sst sich nur von der anderen Seite ”ffnen. Du drehst dich um (1)."
'9
DATA 3, 11,16,10
DATA 1,1
DATA  6, "In diesen Zimmer geht es nach rechts (1), links (2), oder wieder zurck (3)."
'10
DATA 3, 7,8,9
DATA 2,1
DATA  2, "Du hast die M”glichkeit nach rechts durch einen Durchgang zu gehen (1),"
DATA  2, "oder es mit der Tr links zu versuchen (2). Du kannst auch zurck (3)."
'11
DATA 3, 12,13,14
DATA 1,1
DATA 11, "Du hast die Wahl zwischen rechts (1), links (2), oder wieder zurck (3)."
'12
DATA 2, 15,16
DATA 1,1
DATA 10, "Du kannst die rechte Tr durchschreiten (1), oder ins vorige Zimmer gehen (2)."
'13
DATA 1, 25
DATA 1,1
DATA 12, "Diese Tr l„sst sich nur von der anderen Seite ”ffnen. Du drehst dich um (1)."
'14
DATA 1, 11
DATA 1,1
DATA 12, "Diese Tr l„sst sich nur von der anderen Seite ”ffnen. Du drehst dich um (1)."
'15
DATA 3, 7,9,8
DATA 1,1
DATA  2, "Willst du durch den Durchgang vor dir (1), nach rechts (2), oder zurck (3)?"
'16
DATA 3, 17,18,19
DATA 1,1
DATA  5, "Du kannst nach links (1), rechts (2), oder wieder zurckgehen (3)."
'17
DATA 3, 6,4,5
DATA 2,1
DATA  1, "Du hast die M”glichkeit nach links durch den Durchgang zu schreiten (1),"
DATA  1, "in den Fahrstuhl rechts (2), oder zurck zu gehen versuchen (3)."
'18
DATA 2, 21,20
DATA 1,1
DATA  3, "Gehst du nun nach rechts(1), oder zurck(2)?"
'19
DATA 3, 10,11,16
DATA 1,1
DATA  6, "Mit (1) gehst du nach rechts, mit (2) durch die Tr geradeaus, mit (3) zurck."
'20
DATA 3, 19,17,18
DATA 1,1
DATA  5, "Gehe nach links (1), geradeaus (2) oder zurck (3)!"
'21
DATA 2, 22,23
DATA 1,1
DATA  9, "Du hast 2 M”glichkeiten: nach vorne (1) oder in den vorigen Raum (2)."
'22
DATA 3, 24,25,26
DATA 1,1
DATA 13, "Um umzukehren drcke (1). Du kannst auch nach rechts (2) oder geradeaus (3)."
'23
DATA 2, 20,21
DATA 1,1
DATA  3, "Diesen Raum kannst du nach links (1) oder nach hinten (2) verlassen."
'24
DATA 2, 23,22
DATA 1,1
DATA  9, "Gehe geradeaus (1) oder zurck (2)!"
'25
DATA 3, 26,25,24
DATA 1,1
DATA  9, "Willst du durch die Tr vor dir (1), rechts (2) oder hinter dir gehen (3)?"
'26
DATA 0
DATA 1,1
DATA 15, "Du hast es geschafft, aus dem Labyrinth zu entkommen."

