'1  11 21  1211 111221 312211 wie gehts weiter?

CLS
a$ = "1"
DO
 PRINT a$
 a$ = a$ + " "
 t$ = ""
 DO
  q$ = MID$(a$, 1, 1)
  x = 0
  DO
   x = x + 1
  LOOP WHILE MID$(a$, x + 1, 1) = q$
  t$ = t$ + LTRIM$(STR$(x)) + q$
  a$ = RIGHT$(a$, LEN(a$) - x)
 LOOP WHILE LEN(a$) > 1
 a$ = t$
LOOP UNTIL LEN(a$) > 80

