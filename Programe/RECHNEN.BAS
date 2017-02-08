CLS
INPUT "1. Operand: ", a$    'zahl
INPUT "2. Operand: ", b$    'zahl
INPUT "Operation: "; o$     '+
CLS

IF o$ = "+" THEN GOSUB add31: PRINT a$ + " + " + b$ + " = " + c$
IF o$ = "*" THEN GOSUB mul31: PRINT a$ + " * " + b$ + " = " + c$

END

add31:
'addiert a$ und b$ in c$ (je max. ca 10000B)
'add31 => addieren mit 3 operanden, version 1
 
 IF LEN(b$) > LEN(a$) THEN a$ = SPACE$(LEN(b$) - LEN(a$)) + a$
 IF LEN(a$) > LEN(b$) THEN b$ = SPACE$(LEN(a$) - LEN(b$)) + b$
 a$ = " " + a$: b$ = " " + b$
 c$ = SPACE$(LEN(a$))
 FOR add31x = LEN(c$) TO 1 STEP -1
  add31z = VAL(MID$(a$, add31x, 1)) + VAL(MID$(b$, add31x, 1)) + add31m
  add31m = 0
  IF add31z > 9 THEN add31z = add31z - 10: add31m = 1
  MID$(c$, add31x, 1) = LTRIM$(RTRIM$(STR$(add31z)))
 NEXT add31x
 IF MID$(c$, 1, 1) = "0" THEN c$ = RIGHT$(c$, LEN(a$) - 1)
 a$ = LTRIM$(a$)
 b$ = LTRIM$(b$)
RETURN

mul31:
'multipliziert a$ und b$ in c$ (je max. ca 8000B)
'mul31 => multiplizieren mit 3 operanden, version 1

 c$ = SPACE$(LEN(a$) + LEN(b$))
 FOR mul31x1 = LEN(a$) TO 1 STEP -1
  mul31m = 0
  FOR mul31x2 = LEN(b$) TO 1 STEP -1
   mul31q = LEN(c$) - (LEN(a$) - mul31x1) - (LEN(b$) - mul31x2)
   mul31z = VAL(MID$(a$, mul31x1, 1)) * VAL(MID$(b$, mul31x2, 1)) + mul31m
   mul31m = 0
   mul31z = mul31z + VAL(MID$(c$, mul31q, 1))
   DO WHILE mul31z > 9
    mul31z = mul31z - 10: mul31m = mul31m + 1
   LOOP
   MID$(c$, mul31q, 1) = LTRIM$(RTRIM$(STR$(mul31z)))

  NEXT mul31x2
 NEXT mul31x1
 a$ = LTRIM$(a$)
 b$ = LTRIM$(b$)
 c$ = LTRIM$(c$)
 IF MID$(c$, 1, 1) = "0" THEN c$ = RIGHT$(c$, LEN(c$) - 1)
RETURN

