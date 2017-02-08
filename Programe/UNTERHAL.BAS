PRINT "Herzlich Willkommen..."
DO
 INPUT ">", a$

 'groá klein schreibung
 IF UCASE$(a$) <> a$ AND LCASE$(a$) <> a$ AND grokle = 0 THEN PRINT "Ich bin mal nicht so kleinlich, und du brauchst": PRINT "die gross- und klein-schreibung nicht unbedingt beachten": grokle = 1
 a$ = LCASE$(a$)




 ''''''''

 IF INSTR(a$, "hallo") <> 0 THEN PRINT Hallo

 'name eingeben
 IF name$ = "" THEN
  PRINT "Wie heiát du eigentlich"
  INPUT ">", name$
  SELECT CASE LCASE$(name$)
  CASE "rafael": PRINT "Ach du bist es...H„tte ich mir auch denken k”nnen."
  CASE "benny"
   PRINT "Welcher? Pries?"
   INPUT ">", a$: a$ = LCASE$(a$)
   IF a$ = "ja" THEN PRINT "Achso." ELSE PRINT "Dann kenn ich dich wohl nicht."
  CASE ELSE: PRINT "Aha."
  END SELECT
 END IF

LOOP UNTIL a$ = "exit"

