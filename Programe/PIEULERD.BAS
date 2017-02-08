DECLARE SUB Multiplys (o%(), words&, mult&, firstword&)
DECLARE SUB PrintOut (o%(), words&)
DECLARE SUB Multiply (o%(), words&, mult&, firstword&)
DECLARE SUB Divide (o%(), words&, denom&, firstword&)
DECLARE SUB Add (o%(), words&, sign&, firstword&)
DECLARE SUB FastDivide (o%(), words&, denom&)

'ON ERROR GOTO e

DEFLNG A-Z
LOCATE 12: PRINT "    (Pi^2)/8 = 1/1^2 + 1/3^2 + 1/5^2 + 1/7^2 + ..."
CLS
INPUT "how many digits"; digits&

words = digits& \ 4 + 4
terms& = CLNG(digits& / .477) \ 3 + 1
IF terms& MOD 2 > 0 THEN terms& = terms& + 1

'DIM sum(words), term(words)
DIM o(10) AS INTEGER
FOR t = 1 TO 255: r1$ = r1$ + CHR$(0): NEXT t
OPEN "c:\sum.raf" FOR OUTPUT AS #1
FOR raf = 1 TO words / 128 + 1
 PRINT #1, r1$;
NEXT raf
CLOSE
OPEN "c:\term.raf" FOR OUTPUT AS #1
FOR raf = 1 TO words / 128 + 1
 PRINT #1, r1$;
NEXT raf
CLOSE
OPEN "c:\sum.raf" FOR BINARY AS #1
OPEN "c:\term.raf" FOR BINARY AS #2

PRINT TIME$

'sum(1) = 1
o(0) = 1
PUT #1, 2, o(0)

denom& = 3: sign = -1

FOR x& = 1 TO terms& - 1
  
   CALL FastDivide(o(), words, denom&)
   CALL Add(o(), words, sign, 2)
   denom& = denom& + 2: sign = -sign
   LOCATE 3, 1: PRINT INT(x& / terms& * 100)

NEXT x&

firstword = 2: x& = 1
CALL FastDivide(o(), words, 2 * denom&)

DO UNTIL firstword = words

   denom& = denom& + 2
   CALL Add(o(), words, sign, firstword)
   CALL Divide(o(), words, denom&, firstword)
   CALL Multiply(o(), words, x&, firstword)
  
   GET #2, firstword * 2, o(0)
   IF o(0) = 0 THEN firstword = firstword + 1
   x& = x& + 1
   LOCATE 4, 1: PRINT INT(firstword / words * 100)

LOOP

CALL Add(o(), words, sign, firstword)
CALL Multiplys(o(), words, 4, 1)
CALL PrintOut(o(), words)
CLOSE
DO: LOOP WHILE INKEY$ = ""
END

e:
CLOSE
BEEP
PRINT "Error 1234 !"
END

DEFINT A-Z
'--------------------------------------------------------------------
SUB Add (o(), words&, sign&, firstword&)

IF sign = 1 THEN
  
   'add it on
   FOR x = words TO firstword STEP -1
    
     ' sum(x) = sum(x) + term(x)
      GET #1, x * 2, o(0)
      GET #2, x * 2, o(1)
      o(5) = o(0) + o(1)
      o(0) = o(5)
      IF o(0) >= 10000 THEN
         GET #1, x * 2 - 2, o(2)
         o(3) = o(2) + 1
         PUT #1, x * 2 - 2, o(3)
         o(0) = o(5) - 10000
      END IF
      PUT #1, x * 2, o(0)
   NEXT x

ELSE

    'subtract it off
    FOR x = words TO firstword STEP -1
     ' sum(x) = sum(x) - term(x)
      GET #1, x * 2, o(0)
      GET #2, x * 2, o(1)
      o(5) = o(0) - o(1)
      o(0) = o(5)
      IF o(5) < 0 THEN
      GET #1, x * 2 - 2, o(2)
         o(2) = o(2) - 1
         PUT #1, x * 2 - 2, o(2)
         o(0) = o(0) + 10000
      END IF
      PUT #1, x * 2, o(0)
      
    NEXT x

END IF
END SUB

'-------------------------------------------------------------------
SUB Divide (o(), words&, denom&, firstword&)

FOR x = firstword TO words
   GET #2, x * 2, o(0)
   dividend& = remainder& * 10000 + o(0)
   quotient = dividend& \ denom&
   o(0) = quotient
   PUT #2, x * 2, o(0)
   remainder& = dividend& - quotient * denom&
NEXT x

END SUB

'------------------------------------------------------------------------
SUB FastDivide (o(), words&, denom&)
'not really a fast divide, but there are fewer operations
'since dividend& below doesn't have term(x) added on (always 0)

remainder& = 1
FOR x = 2 TO words
   dividend& = remainder& * 10000
   quotient = dividend& \ denom&
   o(0) = quotient
   PUT #2, x * 2, o(0)
   remainder& = dividend& - quotient * denom&
NEXT x

END SUB

'---------------------------------------------------------------------
SUB Multiply (o(), words&, mult&, firstword&)

FOR x = words TO firstword STEP -1
   GET #2, x * 2, o(0)
   product& = mult& * o(0) + carry&
   o(0) = product& MOD 10000
   PUT #2, x * 2, o(0)
   carry& = (product& - o(0)) \ 10000
NEXT x

END SUB

'---------------------------------------------------------------------
SUB Multiplys (o(), words&, mult&, firstword&)

FOR x = words TO firstword STEP -1
   GET #1, x * 2, o(0)
   product& = mult& * o(0) + carry&
   o(0) = product& MOD 10000
   PUT #1, x * 2, o(0)
   carry& = (product& - o(0)) \ 10000
NEXT x

END SUB

'------------------------------------------------------------------
SUB PrintOut (o(), words&)

OPEN "c:\pi.txt" FOR OUTPUT AS #3
PRINT #3, "PI = 3,";
i = 2
DO UNTIL i = words - 1
   GET #1, i * 2, o(0)
   j = o(0)
   IF j > 999 THEN
       PRINT #3, RIGHT$(STR$(j), 4);
   ELSEIF j > 99 THEN
       PRINT #3, "0" + RIGHT$(STR$(j), 3);
   ELSEIF j > 9 THEN
       PRINT #3, "00" + RIGHT$(STR$(j), 2);
   ELSE
       PRINT #3, "000" + RIGHT$(STR$(j), 1);
   END IF
  
   IF (i - 1) MOD 15 = 0 THEN PRINT
   i = i + 1
LOOP
PRINT TIME$

END SUB

