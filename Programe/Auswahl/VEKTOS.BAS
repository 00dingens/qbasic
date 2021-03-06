DECLARE SUB Init ()
DECLARE SUB Vector ()
'旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴-�-퀭� �
'� *** Very Simple Floating-Point Vector Cube ***
'읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴-�-퀭� �
    
' Vector Cube basierend auf dem Floating-Point verfahren.

        COMMON SHARED Distance, NumPoints, NumConn, Vx, Vy, Vz
       
        NumPoints = 8
        NumConn = 12  '  12 od. 24 od. 28

        DIM SHARED Points(NumPoints, 3)
        DIM SHARED Rotated(NumPoints, 2)
        DIM SHARED Connect(NumConn, 2)
     
        Init

        DO WHILE INKEY$ = ""
                PCOPY 3, 2: SCREEN , , 2, 0
       
                WAIT &H3DA, 8
                WAIT &H3DA, 8, 8
       
                Vector
                PCOPY 2, 0: SCREEN , , 2, 0
        LOOP
        END

'---------------------------------------------------------------------------
' Datas for object
' NumPoints=Number of Points (X,Y,Z)
' NumConn=Number of Connects (PointA,PointB)
'---------------------------------------------------------------------------

        REM  points table
        REM  x , y , z
        DATA -50,-50,-50
        DATA 50,-50,-50
        DATA 50,50,-50
        DATA -50,50,-50
        DATA -50,-50,50
        DATA 50,-50,50
        DATA 50,50,50
        DATA -50,50,50

        REM  Points.  (From,To, From,To, ..)
       
        
       
        DATA 1,3, 1,6, 1,8, 2,4
        DATA 2,5, 2,7, 3,6, 3,8
        DATA 4,5, 4,7, 5,7, 6,8
        DATA 1,2, 2,3, 3,4, 4,1
        DATA 1,5, 2,6, 3,7, 4,8
        DATA 5,6, 6,7, 7,8, 8,5
        DATA 1,7, 2,8, 3,5, 4,6

SUB Init
        'copy data into tables
       
        FOR N = 1 TO NumPoints
            READ x, y, z
            Points(N, 1) = x
            Points(N, 2) = y
            Points(N, 3) = z
        NEXT N

        FOR N = 1 TO NumConn
            READ a, b
            Connect(N, 1) = a
            Connect(N, 2) = b
        NEXT N

        Distance = 144
        SCREEN 7
END SUB

SUB Vector
        Vx = Vx + .03
        Vy = Vy + .02
        Vz = Vz + .01

        FOR N = 1 TO NumPoints
        x = Points(N, 1)
        y = Points(N, 2)
        z = Points(N, 3)
        GOSUB Calc
        Rotated(N, 1) = Nx
        Rotated(N, 2) = Ny
        NEXT N

        FOR N = 1 TO NumConn
            LINE (Rotated(Connect(N, 1), 1), Rotated(Connect(N, 1), 2))-(Rotated(Connect(N, 2), 1), Rotated(Connect(N, 2), 2)), 15
        NEXT N
        EXIT SUB

Calc:   Ty = ((y * COS(Vx)) - (z * SIN(Vx)))
        Tz = ((y * SIN(Vx)) + (z * COS(Vx)))
        Tx = ((x * COS(Vy)) - (Tz * SIN(Vy)))
        Tz = ((x * SIN(Vy)) + (Tz * COS(Vy)))
        Ox = Tx
        Tx = ((Tx * COS(Vz)) - (Ty * SIN(Vz)))
        Ty = ((Ox * SIN(Vz)) + (Ty * COS(Vz)))
        Nx = INT(128 * (Tx) / (Distance - (Tz))) + 160
        Ny = INT(100 - (128 * Ty) / (Distance - (Tz)))
        RETURN
END SUB

