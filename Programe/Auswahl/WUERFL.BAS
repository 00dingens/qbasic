
'Immer Enter drÅcken, wenn sich nichts tut. 2x schnell hintereinander fÅr Ende

RANDOMIZE TIMER
GOSUB varis
CLS
DO
 DO: LOOP UNTIL INKEY$ = CHR$(13)
 FOR x = 1 TO 20
  a = INT(RND * 9)
  GOSUB mal

 NEXT x
 IF a = 0 THEN
  bb = bb + 1
  LOCATE 8, 20
  PRINT USING "Punkte: ###.000.000.000.000.000.000.000.000 "; bb
  LOCATE 17, 34
  PRINT "B O N U S " + STR$(bb)
  PLAY "T255l32O2CDEFGAB>CDEFGAB>CDEFGAB>C"
 END IF
LOOP WHILE INKEY$ = ""
END

varis:
DIM a$(8, 3)
o$ = "…ÕÕÕÕÕÕÕª"
u$ = "»ÕÕÕÕÕÕÕº"

a$(0, 1) = "∫ €€€€€ ∫"
a$(0, 2) = "∫ € B € ∫"
a$(0, 3) = "∫ €€€€€ ∫"

a$(1, 1) = "∫       ∫"
a$(1, 2) = "∫   €   ∫"
a$(1, 3) = "∫       ∫"

a$(2, 1) = "∫     € ∫"
a$(2, 2) = "∫       ∫"
a$(2, 3) = "∫ €     ∫"

a$(3, 1) = "∫ €     ∫"
a$(3, 2) = "∫   €   ∫"
a$(3, 3) = "∫     € ∫"

a$(4, 1) = "∫ €   € ∫"
a$(4, 2) = "∫       ∫"
a$(4, 3) = "∫ €   € ∫"

a$(5, 1) = "∫ €   € ∫"
a$(5, 2) = "∫   €   ∫"
a$(5, 3) = "∫ €   € ∫"

a$(6, 1) = "∫ € € € ∫"
a$(6, 2) = "∫       ∫"
a$(6, 3) = "∫ € € € ∫"

a$(7, 1) = "∫ € € € ∫"
a$(7, 2) = "∫  €    ∫"
a$(7, 3) = "∫ € € € ∫"

a$(8, 1) = "∫ € € € ∫"
a$(8, 2) = "∫  € €  ∫"
a$(8, 3) = "∫ € € € ∫"
RETURN

mal:
LOCATE 10, 1
PRINT TAB(35); o$
PRINT TAB(35); a$(a, 1)
PRINT TAB(35); a$(a, 2)
PRINT TAB(35); a$(a, 3)
PRINT TAB(35); u$
RETURN

