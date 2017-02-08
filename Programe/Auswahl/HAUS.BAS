
'Haus in Echter 3D-Berechnung

SCREEN 12
WINDOW (-8, -6)-(0, 0)
q = 10        'Entfernung Betrachter-Bildschirm in dm
'Rohbau
LINE (-7, -3)-(-4, -5), 15, B
LINE -(-4 / (5 + q) * q, -5 / (5 + q) * q)
LINE -(-4 / (5 + q) * q, -3 / (5 + q) * q)
LINE -(-4, -3)
LINE -(-5.5 / (1.5 + q) * q, -1.5 / (1.5 + q) * q)
LINE -(-5.5 / (3.5 + q) * q, -1.5 / (3.5 + q) * q)
LINE -(-4 / (5 + q) * q, -3 / (5 + q) * q)
LINE (-7, -3)-(-5.5 / (1.5 + q) * q, -1.5 / (1.5 + q) * q)
'1.Fenster
LINE (-4 / (.5 + q) * q, -3.5 / (.5 + q) * q)-(-4 / (.5 + q) * q, -4 / (.5 + q) * q)
LINE -(-4 / (1 + q) * q, -4 / (1 + q) * q)
LINE -(-4 / (1 + q) * q, -3.5 / (1 + q) * q)
LINE -(-4 / (.5 + q) * q, -3.5 / (.5 + q) * q)
'2.Fenster
LINE (-4 / (1.5 + q) * q, -3.5 / (1.5 + q) * q)-(-4 / (1.5 + q) * q, -4 / (1.5 + q) * q)
LINE -(-4 / (2 + q) * q, -4 / (2 + q) * q)
LINE -(-4 / (2 + q) * q, -3.5 / (2 + q) * q)
LINE -(-4 / (1.5 + q) * q, -3.5 / (1.5 + q) * q)
'TÅr
LINE (-4 / (2.5 + q) * q, -3.5 / (2.5 + q) * q)-(-4 / (2.5 + q) * q, -5 / (2.5 + q) * q)
LINE -(-4 / (3.5 + q) * q, -5 / (3.5 + q) * q)
LINE -(-4 / (3.5 + q) * q, -3.5 / (3.5 + q) * q)
LINE -(-4 / (2.5 + q) * q, -3.5 / (2.5 + q) * q)
'3.Fenster
LINE (-4 / (4 + q) * q, -3.5 / (4 + q) * q)-(-4 / (4 + q) * q, -4 / (4 + q) * q)
LINE -(-4 / (4.5 + q) * q, -4 / (4.5 + q) * q)
LINE -(-4 / (4.5 + q) * q, -3.5 / (4.5 + q) * q)
LINE -(-4 / (4 + q) * q, -3.5 / (4 + q) * q)
'Alles anmalen
'WÑnde
PAINT (-6, -4), 2, 15
PAINT (-4 / (.2 + q) * q, -4.5 / (.2 + q) * q), 2, 15
'TÅr
PAINT (-4 / (3 + q) * q, -4.5 / (3 + q) * q), 6, 15
'Dach
PAINT (-5.5 / (.5 + q) * q, -2.5 / (.5 + q) * q), 4, 15
PAINT (-4.5 / (2.5 + q) * q, -2.5 / (2.5 + q) * q), 4, 15
'Fenster
PAINT (-4 / (.75 + q) * q, -3.75 / (.75 + q) * q), 1, 15
PAINT (-4 / (1.75 + q) * q, -3.75 / (1.75 + q) * q), 1, 15
PAINT (-4 / (4.25 + q) * q, -3.75 / (4.25 + q) * q), 1, 15

