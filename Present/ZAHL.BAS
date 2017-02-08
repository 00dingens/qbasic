
'Gibt Zahl als Wort aus.
'Zum beenden einfach keine Zahl eingeben.

ON ERROR GOTO er
DIM d(11, 1) AS STRING
DIM n(9, 2) AS STRING
start:
PRINT : PRINT : PRINT
INPUT "Zahl eingeben (h”chstens 36 Stellen):", a$
d(1, 0) = "tausend"
d(2, 0) = "million"
d(2, 1) = "en"
d(3, 0) = "milliarde"
d(3, 1) = "n"
d(4, 0) = "billion"
d(4, 1) = "en"
d(5, 0) = "billiarde"
d(5, 1) = "n"
d(6, 0) = "trillion"
d(6, 1) = "en"
d(7, 0) = "trilliarde"
d(7, 1) = "n"
d(8, 0) = "quattrillion"
d(8, 1) = "en"
d(9, 0) = "quattrilliarde"
d(9, 1) = "n"
d(10, 0) = "quintillion"
d(10, 1) = "en"
d(11, 0) = "quinquilliarde"
d(11, 1) = "n"

n(1, 0) = "ein"
n(2, 0) = "zwei"
n(3, 0) = "drei"
n(4, 0) = "vier"
n(5, 0) = "fnf"
n(6, 0) = "sechs"
n(7, 0) = "sieben"
n(8, 0) = "acht"
n(9, 0) = "neun"

n(1, 1) = "eins"
n(2, 1) = "zwanzig"
n(3, 1) = "dreiáig"
n(4, 1) = "vierzig"
n(5, 1) = "fnfzig"
n(6, 1) = "sechzig"
n(7, 1) = "siebzig"
n(8, 1) = "achtzig"
n(9, 1) = "neunzig"

n(0, 2) = "zehn"
n(1, 2) = "elf"
n(2, 2) = "zw”lf"
n(3, 2) = "dreizehn"
n(4, 2) = "vierzehn"
n(5, 2) = "fnfzehn"
n(6, 2) = "sechzehn"
n(7, 2) = "siebzehn"
n(8, 2) = "achtzehn"
n(9, 2) = "neunzehn"
zahl$ = "": i = 0
FOR x = 1 TO LEN(a$) STEP 3
 z$ = "": q = 0: q1 = 0: q2 = 0: q3 = 0
 q1 = VAL(MID$(a$, LEN(a$) - 1 - x, 1))
 q2 = VAL(MID$(a$, LEN(a$) - x, 1))
 q3 = VAL(MID$(a$, LEN(a$) + 1 - x, 1))
 q = q1 * 100 + q2 * 10 + q3
'''PRINT x, i, q, q1; q2; q3
 IF q > 1 THEN
  SELECT CASE q1
   CASE 0: z$ = ""
   CASE 1: z$ = "einhundert"
   CASE ELSE: z$ = n(q1, 0) + "hundert"
  END SELECT
  SELECT CASE q2
   CASE 0:
   IF q3 = 1 THEN z$ = z$ + n(q3, 1) ELSE z$ = z$ + n(q3, 0)
   CASE 1: z$ = z$ + n(q3, 2)
   CASE ELSE:
   SELECT CASE q3
    CASE 0: z$ = z$ + n(q2, 1)
    CASE ELSE: z$ = z$ + n(q3, 0) + "und" + n(q2, 1)
   END SELECT
  END SELECT
  SELECT CASE i
  CASE 0: zahl$ = z$ + zahl$
  CASE 1: zahl$ = z$ + d(i, 0) + zahl$
  CASE IS > 1: zahl$ = z$ + d(i, 0) + d(i, 1) + zahl$
  END SELECT
 ELSE
  IF q = 1 THEN
   SELECT CASE i
   CASE 0: zahl$ = "eins" + zahl$
   CASE 1: zahl$ = "ein" + d(i, 0) + zahl$
   CASE IS > 1: zahl$ = "eine" + d(i, 0) + zahl$
   CASE ELSE
   END SELECT
  END IF
 END IF
 i = i + 1
NEXT x
IF a$ = "0" THEN zahl$ = "null"
PRINT zahl$
IF a$ = "" THEN END
GOTO start
END
er: RESUME NEXT

