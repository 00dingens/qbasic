'===========================================================================
' Subject: CALCULATE PI                       Date: 01-05-97 (07:59)
'  Author: Jason Stratos Papadopoulos         Code: QB, QBasic, PDS
'  Origin: comp.lang.basic.misc             Packet: ALGOR.ABC
'===========================================================================
DECLARE SUB PrintOut (sum%(), words%, STME$)
DECLARE SUB Multiply (term%(), words%, mult&, firstword%)
DECLARE SUB Divide (term%(), words%, denom&, firstword%)
DECLARE SUB Add (sum%(), term%(), words%, sign%, firstword%)
DECLARE SUB FastDivide (term%(), words%, denom&)

'Program to calculate pi, version 2.0
'The algorithm used is Gregory's series with Euler acceleration.
'This program uses the optimal Euler 2/3 rule: rather than use Euler's
'series for all the terms, compute instead 1/3 of the terms using
'Gregory's series and the rest using Euler's. It can be shown that
'each term in this compound series cuts the error by a factor of 3,
'while using only Euler's series has each term cut the error by a
'factor of 2. This is a major timesaver: it reduces the number of terms
'to be added up by over 35%, and of the terms that remain 1/3 can
'be crunched out faster than normal! The code also includes some tricks
'to speed things up (like reducing the size of the arrays Euler's series
'works on).
'
'Converging faster also means more digits can be computed. Some tests
'show the program is capable of computing about 51,000 digits of pi,
'and is quite fast if compiled (5000 digits in about 90 seconds on
'a 486 66MHz computer). I'd be grateful if someone can help me code
'the Divide and FastDivide SUBs in assembly, which can probably make
'the program twice as fast. Comments or questions to jasonp@wam.umd.edu

DEFINT A-Z

'----------- Intro Screen by (c) Marc Antoni, Oct. 2, 2000 -----------------
COLOR 10, 4
CLS
LOCATE 10: PRINT "  Pi-Berechnung nach Euler (1707 - 1783)"
LOCATE 12: PRINT "    (Pi^2)/8 = 1/1^2 + 1/3^2 + 1/5^2 + 1/7^2 + ..."
LOCATE 20: PRINT "              Programming by Jason Stratos Papadopoulos"
LOCATE 24: PRINT "              ... weiter mit beliebiger Taste"
DO: LOOP WHILE INKEY$ = ""

'----------- End of Intro Screen -------------------------------------------
CLS
'INPUT "how many digits"; digits&

digits& = 1400

words = digits& \ 4 + 4
terms& = CLNG(digits& / .477) \ 3 + 1
IF terms& MOD 2 > 0 THEN terms& = terms& + 1
DIM sum(words), term(words)

                                          'Gregory's Series-------
STME$ = DATE$ + " " + TIME$
sum(1) = 1: denom& = 3: sign = -1

FOR x& = 1 TO terms& - 1
  
   CALL FastDivide(term(), words, denom&)
   CALL Add(sum(), term(), words, sign, 2)
   denom& = denom& + 2: sign = -sign
   LOCATE 3, 1: PRINT x&; " von "; (terms& - 1)
   
NEXT x&
                                          'Euler's Acceleration---
firstword = 2: x& = 1
CALL FastDivide(term(), words, 2 * denom&)

DO UNTIL firstword = words
  
   denom& = denom& + 2
   CALL Add(sum(), term(), words, sign, firstword)
   CALL Divide(term(), words, denom&, firstword)
   CALL Multiply(term(), words, x&, firstword)
  
    IF term(firstword) = 0 THEN firstword = firstword + 1
    x& = x& + 1
    'LOCATE 4, 1: PRINT firstword; "von"; words; " ("; x&; ")"
    LOCATE 1, 1
    FOR i = 2 TO words - 1
      j = sum(i)
      PRINT RIGHT$("0000" + RTRIM$(LTRIM$(STR$(j))), 4);
    NEXT i

LOOP
                                          'Finish up--------------
CALL Add(sum(), term(), words, sign, firstword)
CALL Multiply(sum(), words, 4, 1)
CALL PrintOut(sum(), words, STME$)
DO: LOOP WHILE INKEY$ = ""
END

'--------------------------------------------------------------------
SUB Add (sum(), term(), words, sign, firstword)

IF sign = 1 THEN
  
   'add it on
   FOR x = words TO firstword STEP -1
      sum(x) = sum(x) + term(x)
      IF sum(x) >= 10000 THEN
         sum(x - 1) = sum(x - 1) + 1
         sum(x) = sum(x) - 10000
      END IF
   NEXT x

ELSE

    'subtract it off
    FOR x = words TO firstword STEP -1
       sum(x) = sum(x) - term(x)
       IF sum(x) < 0 THEN
          sum(x - 1) = sum(x - 1) - 1
          sum(x) = sum(x) + 10000
       END IF
    NEXT x

END IF
END SUB

'-------------------------------------------------------------------
SUB Divide (term(), words, denom&, firstword)

FOR x = firstword TO words
   dividend& = remainder& * 10000 + term(x)
   quotient = dividend& \ denom&
   term(x) = quotient
   remainder& = dividend& - quotient * denom&
NEXT x

END SUB

'------------------------------------------------------------------------
SUB FastDivide (term(), words, denom&)
'not really a fast divide, but there are fewer operations
'since dividend& below doesn't have term(x) added on (always 0)

remainder& = 1
FOR x = 2 TO words
   dividend& = remainder& * 10000
   quotient = dividend& \ denom&
   term(x) = quotient
   remainder& = dividend& - quotient * denom&
NEXT x

END SUB

'---------------------------------------------------------------------
SUB Multiply (term(), words, mult&, firstword)

FOR x = words TO firstword STEP -1
   product& = mult& * term(x) + carry&
   term(x) = product& MOD 10000
   carry& = (product& - term(x)) \ 10000
NEXT x

END SUB

'------------------------------------------------------------------
SUB PrintOut (sum(), words, STME$)

OPEN "c:\windows\desktop\pi.txt" FOR APPEND AS #1

PRINT : PRINT "pi = 3."
PRINT #1, "pi = 3."
FOR i = 2 TO words - 1
   j = sum(i)
   PRINT RIGHT$("0000" + RTRIM$(LTRIM$(STR$(j))), 4);
   PRINT #1, RIGHT$("0000" + RTRIM$(LTRIM$(STR$(j))), 4);
NEXT i
PRINT
PRINT (words - 2) * 4; "Stellen errechnet"
PRINT "von: "; STME$
PRINT "bis: "; DATE$; " "; TIME$
PRINT #1, ""
PRINT #1, (words - 2) * 4; "Stellen"
PRINT #1, "von: "; STME$
PRINT #1, "bis: "; DATE$; " "; TIME$
PRINT #1, ""
CLOSE
END SUB

