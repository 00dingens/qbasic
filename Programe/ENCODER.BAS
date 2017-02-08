
'datei ”ffnen machen.


CLS
a$ = "alles einfacher als es aussieht"
c = 13
a$ = UCASE$(a$)
FOR x = 1 TO LEN(a$)
 IF ASC(MID$(a$, x, 1)) > 64 AND ASC(MID$(a$, x, 1)) < 91 THEN
  MID$(a$, x, 1) = CHR$(64 + ((ASC(UCASE$(MID$(a$, x, 1))) + c - 64) MOD 26))
 END IF
NEXT x

PRINT a$

