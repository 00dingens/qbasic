
'Ordnet Zeichenfolgen

CLS
INPUT "Anzahl der Elemente "; n
DIM a$(n)
FOR i = 1 TO n
PRINT i; ". Element";
INPUT a$(i)
NEXT i
FOR i = 1 TO n - 1
k = i
FOR j = i + 1 TO n
IF a$(j) < a$(k) THEN k = j
NEXT j
IF k > i THEN h$ = a$(i): a$(i) = a$(k): a$(k) = h$
NEXT i
PRINT : PRINT
FOR i = 1 TO n
PRINT i, a$(i)
NEXT i
END

