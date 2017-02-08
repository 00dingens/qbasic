GOSUB vorbereitungen
GOSUB malen
GOSUB bild
GOSUB anmalen
END


vorbereitungen:
SCREEN 12
DO
  LOCATE 3, 23
  PRINT "Grobheit (8-50) :";
  INPUT gro%
  CLS
LOOP UNTIL gro% < 100 AND gro% > 0
PRINT TAB(20); "Nicht anmalenúúúúúúúúúúúúú 0"
PRINT TAB(20); "Weiá anmalenúúúúúúúúúúúúúú 1"
DO: t$ = INKEY$: LOOP UNTIL t$ = "0" OR t$ = "1"
CLS
an = VAL(t$): gr = gro%: x = INT(640 / gr): y = INT(480 / gr): pi = 3.141592
DIM q(x * y)
FOR a = 0 TO x * y
 q(a) = a
NEXT a
FOR a = 0 TO x * y
 SWAP q(a), q(INT(RND * (x * y) + 1))
NEXT a
RETURN

malen:
PRINT "()$²±~'"
PRINT "©Hallo "
PRINT "Du da! "
RETURN

bild:
FOR a = 0 TO x * y
n = q(a) MOD x: m = INT(q(a) / x)
IF (n - 1) * gr < x AND (m - 1) * gr < y THEN
ELSE
  IF POINT(n, m) <> 0 THEN
'    CIRCLE ((n - .5) * gr, (m - .5) * gr), gr / 2 - 1, 1
'    PAINT STEP(0, 0), 1, 1
   
   
    IF POINT(n - 1, m - 1) = 0 THEN
      IF POINT(n, m - 1) = 0 AND POINT(n - 1, m) = 0 THEN
        CIRCLE ((n - .5) * gr, (m - .5) * gr), gr / 2, 15, pi * .5, pi
      END IF
    END IF
   
    IF POINT(n, m - 1) <> 0 THEN
      IF POINT(n + 1, m - 1) = 0 AND POINT(n + 1, m) = 0 THEN
        LINE (n * gr, (m - 1) * gr)-STEP(0, gr / 2), 15
      END IF
      IF POINT(n - 1, m - 1) = 0 AND POINT(n - 1, m) = 0 THEN
        LINE ((n - 1) * gr, (m - 1) * gr)-STEP(0, gr / 2), 15
      END IF
    END IF
 
    IF POINT(n + 1, m - 1) = 0 THEN
      IF POINT(n + 1, m) = 0 AND POINT(n, m - 1) = 0 THEN
        CIRCLE ((n - .5) * gr, (m - .5) * gr), gr / 2, 15, 0, pi * .5
      END IF
    END IF
  
    IF POINT(n + 1, m) <> 0 THEN
      IF POINT(n + 1, m + 1) = 0 AND POINT(n, m + 1) = 0 THEN
        LINE (n * gr, m * gr)-STEP(-gr / 2, 0), 15
      END IF
      IF POINT(n + 1, m - 1) = 0 AND POINT(n, m - 1) = 0 THEN
        LINE (n * gr, (m - 1) * gr)-STEP(-gr / 2, 0), 15
      END IF
    END IF

    IF POINT(n + 1, m + 1) = 0 THEN
      IF POINT(n, m + 1) = 0 AND POINT(n + 1, m) = 0 THEN
        CIRCLE ((n - .5) * gr, (m - .5) * gr), gr / 2, 15, pi * 1.5, pi * 2
      END IF
    END IF
 
    IF POINT(n, m + 1) <> 0 THEN
      IF POINT(n - 1, m + 1) = 0 AND POINT(n - 1, m) = 0 THEN
        LINE ((n - 1) * gr, m * gr)-STEP(0, -gr / 2), 15
      END IF
      IF POINT(n + 1, m + 1) = 0 AND POINT(n + 1, m) = 0 THEN
        LINE (n * gr, m * gr)-STEP(0, -gr / 2), 15
      END IF
    END IF

    IF POINT(n - 1, m + 1) = 0 THEN
      IF POINT(n - 1, m) = 0 AND POINT(n, m + 1) = 0 THEN
        CIRCLE ((n - .5) * gr, (m - .5) * gr), gr / 2, 15, pi, pi * 1.5
      END IF
    END IF
   
    IF POINT(n - 1, m) <> 0 THEN
      IF POINT(n - 1, m - 1) = 0 AND POINT(n, m - 1) = 0 THEN
        LINE ((n - 1) * gr, (m - 1) * gr)-STEP(gr / 2, 0), 15
      END IF
      IF POINT(n - 1, m + 1) = 0 AND POINT(n, m + 1) = 0 THEN
        LINE ((n - 1) * gr, m * gr)-STEP(gr / 2, 0), 15
      END IF
    END IF

  ELSE

    IF POINT(n, m - 1) <> 0 THEN
      IF POINT(n + 1, m) <> 0 THEN
        CIRCLE ((n - .5) * gr, (m - .5) * gr), gr / 2, 15, 0, pi * .5
      END IF
      IF POINT(n - 1, m) <> 0 THEN
        CIRCLE ((n - .5) * gr, (m - .5) * gr), gr / 2, 15, pi * .5, pi * 1
      END IF
    END IF
  
    IF POINT(n, m + 1) <> 0 THEN
      IF POINT(n - 1, m) <> 0 THEN
        CIRCLE ((n - .5) * gr, (m - .5) * gr), gr / 2, 15, pi * 1, pi * 1.5
      END IF
      IF POINT(n + 1, m) <> 0 THEN
        CIRCLE ((n - .5) * gr, (m - .5) * gr), gr / 2, 15, pi * 1.5, pi * 2
      END IF
    END IF
 
  END IF
END IF
NEXT a
RETURN

anmalen:
IF an = 0 THEN
  RETURN
END IF

IF an = 1 THEN
  LINE (0, 0)-(640 - gr, 480 - gr), 15, B
  LINE (0, 0)-(x + gr, y + gr), 15, B
  LINE (0, 0)-(x, y), 15, B
  FOR a = 0 TO x * y
    n = q(a) MOD x: m = INT(q(a) / x)
    IF (n - 1) * gr < x AND (m - 1) * gr < y THEN
    ELSE
      IF POINT(n, m) <> 0 THEN
        PAINT ((n - .5) * gr, (m - .5) * gr), 7, 15
      END IF
    END IF
  NEXT a
  LINE (0, 0)-(640 - gr, 480 - gr), 0, B
  LINE (0, 0)-(x + gr, y + gr), 0, B
  LINE (0, 0)-(x, y), 0, B
END IF
RETURN

