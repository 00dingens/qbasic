
'Dies Habe ich auf einem 386er geschrieben, als er die Festplatte nicht mehr
'fand und ich alles versucht hatte.

CLS
COLOR 7
LOCATE 12, 21
PRINT "D R U E C K E   E I N E   T A S T E !"
a = 1
DO
OUT &H3C8, 7
OUT &H3C9, x
OUT &H3C9, 15
OUT &H3C9, 15
x = x + a
IF x > 63 THEN x = 63: a = -1
IF x < 0 THEN x = 0: a = 1
FOR q = 1 TO 100: NEXT q
LOOP WHILE INKEY$ = ""
DO
COLOR INT(RND * 16)
PRINT "So ein Aerger, darueber koennte ich mich aufregen!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
LOOP WHILE INKEY$ = ""

