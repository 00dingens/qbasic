
' Programm, das einen Bildschirmausschnitt vergr”áert und
' unter C:\WINDOWS\DESKTOP\mikro.txt speichert.

SCREEN 12
x = 80: y = 32  'Maáe des Ausschnitts

PRINT "Hallo, du!"
PRINT "Wie gehts?"

OPEN "C:\WINDOWS\DESKTOP\mikro.txt" FOR OUTPUT AS #1
FOR z = 1 TO 5
 SELECT CASE z
 CASE 1: r$ = "Û"
 CASE 2: r$ = "ÛÛ"
 CASE 3: r$ = "#"
 CASE 4: r$ = "O"
 CASE 5: r$ = "X"
 END SELECT
 FOR m = 0 TO y
  FOR n = 0 TO x
   IF POINT(n, m) = 0 THEN PRINT #1, SPACE$(LEN(r$));  ELSE PRINT #1, r$;
  NEXT n
  PRINT #1, ""
 NEXT m
 PRINT #1, ""
 PRINT #1, ""
 PRINT #1, ""
NEXT z

FOR z = 1 TO 5
 SELECT CASE z
 CASE 1: r$ = "#": rr$ = "+"
 CASE 2: r$ = "Û": rr$ = "±"
 CASE 3: r$ = "Û": rr$ = "þ"
 CASE 4: r$ = "O": rr$ = "o"
 CASE 5: r$ = "X": rr$ = "x"
 END SELECT
 FOR m = 0 TO y
  FOR n = 0 TO x
   IF POINT(n, m) = 0 THEN
    IF POINT(n + 1, m + 1) = 0 THEN PRINT #1, " ";  ELSE PRINT #1, rr$;
   ELSE
    PRINT #1, r$;
   END IF
  NEXT n
  PRINT #1, ""
 NEXT m
 PRINT #1, ""
 PRINT #1, ""
 PRINT #1, ""
NEXT z


CLOSE

