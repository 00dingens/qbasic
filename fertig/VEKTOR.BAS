DEFINT A-Z

TYPE pnt                                        'type for each 3D point
    X AS INTEGER                                'x coord (horizontal)
    y AS INTEGER                                'y coord (vertical)
    Z AS INTEGER                                'z coord (into the screen)
    p AS INTEGER                                'dist from center of object
END TYPE

numLines = 33 - 1

DIM lO(numLines, 1) AS pnt                      'Original line coords
DIM lR(numLines, 1) AS pnt                      'Rotated coords
DIM scrX(numLines, 1)                           'screen x coord
DIM scrY(numLines, 1)                           'screen y coord
DIM oldX(numLines, 1)                           'old x coord for erasing
DIM oldY(numLines, 1)                           'old y coord for erasing

DIM s!(359)                                     'trig tables
DIM c!(359)

CONST PI = 3.141592

FOR i = 0 TO 359                                'create sine and cosine
   s!(i) = SIN(i * (PI / 180))                  'look up tables to speed up
   c!(i) = COS(i * (PI / 180))                  'the math
NEXT

' Read two points instead of one.
FOR i = 0 TO numLines
   READ lO(i, 0).X, lO(i, 0).y, lO(i, 0).Z, lO(i, 0).p
   READ lO(i, 1).X, lO(i, 1).y, lO(i, 1).Z, lO(i, 1).p
NEXT

SCREEN 12
CLS

xCenter = 320: yCenter = 240: zCenter = 100
theta = 0: phi = 0
thetaRot = 2: phiRot = 1

justStarted = 1
DO
  FOR i = 0 TO numLines
     ' Save the old values of x and y so we can erase the balls later.
     oldX(i, 0) = scrX(i, 0): oldY(i, 0) = scrY(i, 0)
     oldX(i, 1) = scrX(i, 1): oldY(i, 1) = scrY(i, 1)
   
     ' Rotate both points on each axis.
     lR(i, 0).X = -lO(i, 0).X * s!(theta) + lO(i, 0).y * c!(theta)
     lR(i, 0).y = -lO(i, 0).X * c!(theta) * s!(phi) - lO(i, 0).y * s!(theta) * s!(phi) - lO(i, 0).Z * c!(phi) + lO(i, 0).p
     lR(i, 0).Z = -lO(i, 0).X * c!(theta) * c!(phi) - lO(i, 0).y * s!(theta) * c!(phi) + lO(i, 0).Z * s!(phi)

     lR(i, 1).X = -lO(i, 1).X * s!(theta) + lO(i, 1).y * c!(theta)
     lR(i, 1).y = -lO(i, 1).X * c!(theta) * s!(phi) - lO(i, 1).y * s!(theta) * s!(phi) - lO(i, 1).Z * c!(phi) + lO(i, 1).p
     lR(i, 1).Z = -lO(i, 1).X * c!(theta) * c!(phi) - lO(i, 1).y * s!(theta) * c!(phi) + lO(i, 1).Z * s!(phi)

     ' Translate both points from 3D to 2D.
     IF (lR(i, 0).Z + zCenter) <> 0 THEN
       scrX(i, 0) = 256 * (lR(i, 0).X / (lR(i, 0).Z + zCenter)) + xCenter
       scrY(i, 0) = 256 * (lR(i, 0).y / (lR(i, 0).Z + zCenter)) + yCenter
     END IF

     IF (lR(i, 1).Z + zCenter) <> 0 THEN
       scrX(i, 1) = 256 * (lR(i, 1).X / (lR(i, 1).Z + zCenter)) + xCenter
       scrY(i, 1) = 256 * (lR(i, 1).y / (lR(i, 1).Z + zCenter)) + yCenter
     END IF
  NEXT i

  ' Erase the old lines.
  WAIT &H3DA, 8
  IF justStarted = 0 THEN
    FOR i = 0 TO numLines
       LINE (oldX(i, 0), oldY(i, 0))-(oldX(i, 1), oldY(i, 1)), 0
    NEXT i
  END IF

  ' Draw the new lines.
  FOR i = 0 TO numLines
     LINE (scrX(i, 0), scrY(i, 0))-(scrX(i, 1), scrY(i, 1)), 11
  NEXT i

  theta = (theta + thetaRot) MOD 360
  phi = (phi + phiRot) MOD 360

  justStarted = 0
LOOP UNTIL INKEY$ = CHR$(27)

' Lines are stored in format (X1,Y1,Z1,p1)-(X2,Y2,Z2,p2)

'FÅr A
'Vorne
DATA -10,-40, 10,1, 10,-40, 10,1
DATA  10,-40, 10,1, 50, 40, 10,1
DATA  50, 40, 10,1, 30, 40, 10,1
DATA  30, 40, 10,1, 20, 20, 10,1
DATA  20, 20, 10,1,-20, 20, 10,1
DATA -20, 20, 10,1,-30, 40, 10,1
DATA -30, 40, 10,1,-50, 40, 10,1
DATA -50, 40, 10,1,-10,-40, 10,1
DATA   0,-20, 10,1, 10,  0, 10,1
DATA  10,  0, 10,1,-10,  0, 10,1
DATA -10,  0, 10,1,  0,-20, 10,1
'Hinten
DATA -10,-40,-10,1, 10,-40,-10,1
DATA  10,-40,-10,1, 50, 40,-10,1
DATA  50, 40,-10,1, 30, 40,-10,1
DATA  30, 40,-10,1, 20, 20,-10,1
DATA  20, 20,-10,1,-20, 20,-10,1
DATA -20, 20,-10,1,-30, 40,-10,1
DATA -30, 40,-10,1,-50, 40,-10,1
DATA -50, 40,-10,1,-10,-40,-10,1
DATA   0,-20,-10,1, 10,  0,-10,1
DATA  10,  0,-10,1,-10,  0,-10,1
DATA -10,  0,-10,1,  0,-20,-10,1
'Verbindungen
DATA -10,-40, 10,1,-10,-40,-10,1
DATA  10,-40, 10,1, 10,-40,-10,1
DATA  50, 40, 10,1, 50, 40,-10,1
DATA  30, 40, 10,1, 30, 40,-10,1
DATA  20, 20, 10,1, 20, 20,-10,1
DATA -20, 20, 10,1,-20, 20,-10,1
DATA -30, 40, 10,1,-30, 40,-10,1
DATA -50, 40, 10,1,-50, 40,-10,1
DATA   0,-20, 10,1,  0,-20,-10,1
DATA  10,  0, 10,1, 10,  0,-10,1
DATA -10,  0, 10,1,-10,  0,-10,1




'fÅr WÅrfel
DATA -50, 50, 50,1, 50, 50, 50,1
DATA  50,-50, 50,1, 50, 50, 50,1
DATA  50, 50,-50,1, 50, 50, 50,1
DATA -50,-50, 50,1,-50, 50, 50,1
DATA -50, 50,-50,1,-50, 50, 50,1
DATA -50,-50, 50,1, 50,-50, 50,1
DATA -50, 50,-50,1, 50, 50,-50,1
DATA -50,-50,-50,1, 50,-50,-50,1
DATA -50,-50,-50,1,-50, 50,-50,1
DATA  50,-50,-50,1, 50,-50, 50,1
DATA  50,-50,-50,1, 50, 50,-50,1
DATA -50,-50,-50,1,-50,-50, 50,1

