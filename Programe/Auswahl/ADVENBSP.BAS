
'Ein angefangenes Beispiel fÅr ein Adventure

sit = 100: zei = 20: moe = 9
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
LOCATE 23, 1
'WIDTH 80, 50: LOCATE 48, 1   'Das erste (') dieser Zeile darf entfernt werden
DO
 x = s
 FOR y = 1 TO a(x, 0, 0)
  IF a(x, 0, y) = 0 THEN COLOR 15 ELSE COLOR a(x, 0, y)
  PRINT a$(x, y)
 NEXT y
 IF a(x, 1, 0) <> 0 THEN
  COLOR 8
  PRINT : PRINT "DrÅcke eine Zahl von 1 bis"; a(x, 1, 0)
  DO: q = VAL(INKEY$): LOOP UNTIL q > 0 AND q <= a(x, 1, 0)
  PRINT "Wahl:"; q
  s = a(x, 1, q)
 ELSE : COLOR 8: END
 END IF
 PRINT : PRINT : PRINT
LOOP


DATA 12

'1
DATA  2,2,3
DATA  3,1
DATA  1,"Hi! Das hier ist ein Text-Adventure. Soviel zum Informativen. Los geht's!"
DATA  9,"Du rennst gerade mit Hîchstgeschwindigkeit auf eine TÅr zu (Richtung: Osten)."
DATA  9,"Jetzt mal eine Frage: Kannst du gut zielen (1), oder nicht (2)?"
'2
DATA  1,4
DATA  3,1
DATA  9,"Super fÅr dich, dass du zielen kannst, du hast nÑmlich gerade die TÅr,"
DATA  9,"auf die du zuranntest, getroffen! Da sie aufgeht, wenn man schnell"
DATA 10,"darauf zulÑuft, bist du hindurchgeflogen! DrÅcke (1)!
'3
DATA  0
DATA  3,1
DATA  4,"Da du nicht zielen kannst, hast du die TÅr um gute 3 Meter verfehlt!"
DATA  4,"Du bist voll gegen die Betonwand, in die die TÅr eingelassen ist, geplatscht!"
DATA  4,"Deine öberreste kleben nun im Umkreis von ca. 20 Metern an ihr. (HAPPY) END"
'4
DATA  3,5,6,8
DATA  3,1
DATA 10,"Du stehst in einem Raum mit 3 TÅren. Durch welche mîchtest du durchgehen:"
DATA 10,"Durch die TÅr nach Westen (auch W-TÅr genannt) (1), die O-TÅr (2),oder die"
DATA 10,"S-TÅr (3)? öbrigens steht N fÅr Nord, S fÅr SÅd, O fÅr Ost, W fÅr West."
'5
DATA  1,4
DATA  2,1
DATA 10,"Diese TÅr geht nur auf, wenn man mit genug Schwung auf sie zurennt. Leider"
DATA 10,"hast du keinen Platz um Anlauf zu nehmen. DrÅcke (1)!"
'6
DATA  2,4,7
DATA  2,1
DATA 10,"Der Raum, in dem du dich befindest, hat 2 AusgÑnge. Durch welchen von ihnen"
DATA 10,"hast du vor aus diesem Raum rauszukommen: W-Ausgang (1) oder S-Ausgang (2)"
'7
DATA  1,6
DATA  2,1
DATA 10,"Dieser Ausgang ist eine DrehtÅr, durch welche man zwar offensichtlich von"
DATA 10,"der anderen Seite durchgehen kann, aber nicht von hier. DrÅcke (1)!"
'8
DATA  3,4,9,12
DATA  2,1
DATA 10,"Das Zimmer in dem du dich nun befindest kann man auf 3 Arten verlassen:"
DATA 10,"Durch die N-TÅr (1), die S-TÅr (2), oder eine Luke nach unten (3)."
'9
DATA  3,8,11,10
DATA  3,1
DATA 10,"Nun bist du in einem Raum in dessen Mitte ein mÑchtiger Tisch auf den ein"
DATA 10,"winziges Blatt genagelt ist. Willst du den Raum wieder verlassen (1), dir"
DATA 10,"den Tisch nÑher anschauen (2) oder mit dem Kopf gegen die Wand donnern (3)?"
'10
DATA 0
DATA 4,1
DATA 4,"Du gibst also auf! Naja, selbst schuld! Du donnerst 392 mal gegen die Wand,"
DATA 4,"ohne dass etwas passiert. Beim 393. Mal platzt dein Kopf und dein Gehirn"
DATA 4,"flutscht auf den Boden. Du flutscht hinterher und stirbst nach ca. 6-stÅndigem"
DATA 4,"rumzucken. Das Spiel ist aus! Ich hoffe es hat dir gefallen! Spiel mal wieder!"
'11
DATA  1,9
DATA  6,1
DATA 10,"Du schaust dir den Tisch also nÑher an. Er selbst ist nicht sehr interessant,"
DATA 10,"dafÅr aber das draufgenagelte Zettelchen. Es wurde mit abgekauten FingernÑgeln"
DATA 10,"festgenagelt. Das stîrt dich aber nicht. Auf ihm kann man folgendes lesen:"
DATA  7,"SchlÅsselnummer: 67123"
DATA 10,"Du ahnst das diese Nummer dir bald weiterhelfen wird, und freust dich."
DATA 10,"Jetzt wendest du dich vom Tisch ab und anderen Dingen zu. DrÅcke (1)!"
'12
DATA  0
DATA  1,1
DATA 20,"Weiter kam ich noch nicht!!!  Dies ist ja nur ein Beispiel."

