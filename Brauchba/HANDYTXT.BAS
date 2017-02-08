DIM i(9), n(100), w(100), z(9, 4) AS STRING
CLS
WIDTH 80, 50
PRINT "Wenn man auf nem Handy ein Wort eingibt, benutzt man verschiedene Tasten,"
PRINT "und die Tasten, die man fr das gesuchte Wort benutzt,"
PRINT "ergeben die Zahlenkombination. Fr z.B. EMINEM ist 364636 einzugeben."
anz = 1
i(2) = 3: i(3) = 3: i(4) = 3: i(5) = 3: i(6) = 3: i(7) = 4: i(8) = 3: i(9) = 4
FOR x = 2 TO 9
 FOR y = 1 TO i(x)
  READ z(x, y)
 NEXT y
NEXT x
FOR x = 1 TO 100
 n(x) = 1
NEXT x
INPUT "Gib die Zahlenkombination ein: ", a$
IF a$ = "" THEN END
IF LEN(a$) > 38 THEN PRINT "Zu lang!"
FOR x = 1 TO LEN(a$)
 w(x) = VAL(MID$(a$, x, 1))
NEXT x
FOR x = 1 TO LEN(a$)
 IF w(x) < 2 THEN PRINT "An der Stelle Nr."; x; "steht ein unerlaubtes Zeichen!": END
 anz = anz * i(w(x))
NEXT x
PRINT anz
CLS
PRINT a$ + ":"
FOR x = 1 TO LEN(a$)
 FOR t = 1 TO i(w(x))
  LOCATE t + 2, x * 2: PRINT z(w(x), t)
 NEXT t
NEXT x
PRINT : PRINT
OPEN "c:\windows\desktop\handy.txt" FOR OUTPUT AS #1
PRINT #1, a$ + ":"
PRINT #1, ""
FOR x = 1 TO anz
 q$ = " "
 FOR y = 1 TO LEN(a$)
  q$ = q$ + z(w(y), n(y))
 NEXT y
 PRINT q$;
 PRINT #1, q$;
 FOR t = LEN(a$) TO 1 STEP -1
  n(t) = n(t) + 1
  IF n(t) > i(w(t)) THEN n(t) = 1 ELSE EXIT FOR
 NEXT t
NEXT x
PRINT
PRINT "Alle m”glichen Kombinationen stehen in c:\windows\desktop\handy.txt"
CLOSE

DATA A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z

