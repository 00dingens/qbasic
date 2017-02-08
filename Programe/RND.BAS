SCREEN 12
 FOR x = 1 TO 6553'5
  'z = ((z XOR 22326) + 63) MOD 65536
  'z = ((z XOR 12370) + 51) MOD 65536
  'z = ((z XOR 12370) + 127) MOD 65536
  'z = ((z XOR 44444) + 77) MOD 65536
  'z = ((z XOR 28888) + 77) MOD 65536
  z = ((z XOR 27000) + 111) MOD 65536
 
  PSET (z MOD 256, INT(z / 256)), 1
  PSET (256 + z MOD 512, INT(z / 512)), 2
  PSET (256 + INT(z / 128), 128 + z MOD 128), 4
 NEXT x

