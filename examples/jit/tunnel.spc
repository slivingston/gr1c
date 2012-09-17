ENV: obs_x obs_y;
SYS: x y;

ENVINIT: obs_x=1 & obs_y=2;
ENVTRANS:
  []((obs_x=0) -> (obs_x'=0 | obs_x'=1))
& []((obs_x=1) -> (obs_x'=0 | obs_x'=1 | obs_x'=2))
& []((obs_x=2) -> (obs_x'=1 | obs_x'=2 | obs_x'=3))
& []((obs_x=3) -> (obs_x'=2 | obs_x'=3 | obs_x'=4))
& []((obs_x=4) -> (obs_x'=3 | obs_x'=4 | obs_x'=5))
& []((obs_x=5) -> (obs_x'=4 | obs_x'=5 | obs_x'=6))
& []((obs_x=6) -> (obs_x'=5 | obs_x'=6 | obs_x'=7))
& []((obs_x=7) -> (obs_x'=6 | obs_x'=7 | obs_x'=8))
& []((obs_x=8) -> (obs_x'=7 | obs_x'=8 | obs_x'=9))
& []((obs_x=9) -> (obs_x'=8 | obs_x'=9 | obs_x'=10))
& []((obs_x=10) -> (obs_x'=9 | obs_x'=10 | obs_x'=11))
& []((obs_x=11) -> (obs_x'=10 | obs_x'=11 | obs_x'=12))
& []((obs_x=12) -> (obs_x'=11 | obs_x'=12 | obs_x'=13))
& []((obs_x=13) -> (obs_x'=12 | obs_x'=13 | obs_x'=14))
& []((obs_x=14) -> (obs_x'=13 | obs_x'=14 | obs_x'=15))
& []((obs_x=15) -> (obs_x'=14 | obs_x'=15))

& []((obs_y=0) -> (obs_y'=0 | obs_y'=1))
& []((obs_y=1) -> (obs_y'=0 | obs_y'=1 | obs_y'=2))
& []((obs_y=2) -> (obs_y'=1 | obs_y'=2 | obs_y'=3))
& []((obs_y=3) -> (obs_y'=2 | obs_y'=3 | obs_y'=4))
& []((obs_y=4) -> (obs_y'=3 | obs_y'=4 | obs_y'=5))
& []((obs_y=5) -> (obs_y'=4 | obs_y'=5 | obs_y'=6))
& []((obs_y=6) -> (obs_y'=5 | obs_y'=6 | obs_y'=7))
& []((obs_y=7) -> (obs_y'=6 | obs_y'=7))

& []((obs_x=0 & obs_x'=0) | (obs_x=1 & obs_x'=1) | (obs_x=2 & obs_x'=2) | (obs_x=3 & obs_x'=3) | (obs_x=4 & obs_x'=4) | (obs_x=5 & obs_x'=5) | (obs_x=6 & obs_x'=6) | (obs_x=7 & obs_x'=7) | (obs_x=8 & obs_x'=8) | (obs_x=9 & obs_x'=9) | (obs_x=10 & obs_x'=10) | (obs_x=11 & obs_x'=11) | (obs_x=12 & obs_x'=12) | (obs_x=13 & obs_x'=13) | (obs_x=14 & obs_x'=14) | (obs_x=15 & obs_x'=15) | (obs_y=0 & obs_y'=0) | (obs_y=1 & obs_y'=1) | (obs_y=2 & obs_y'=2) | (obs_y=3 & obs_y'=3) | (obs_y=4 & obs_y'=4) | (obs_y=5 & obs_y'=5) | (obs_y=6 & obs_y'=6) | (obs_y=7 & obs_y'=7))

& []((obs_x'=1 & obs_y'=2) | (obs_x'=2 & obs_y'=2) | (obs_x'=3 & obs_y'=2) | (obs_x'=4 & obs_y'=2) | (obs_x'=5 & obs_y'=2) | (obs_x'=6 & obs_y'=2) | (obs_x'=7 & obs_y'=2) | (obs_x'=8 & obs_y'=2) | (obs_x'=9 & obs_y'=2) | (obs_x'=3 & obs_y'=0) | (obs_x'=3 & obs_y'=1) | (obs_x'=3 & obs_y'=2) | (obs_x'=3 & obs_y'=3) | (obs_x'=6 & obs_y'=0) | (obs_x'=6 & obs_y'=1) | (obs_x'=6 & obs_y'=2) | (obs_x'=6 & obs_y'=3) | (obs_x'=9 & obs_y'=0) | (obs_x'=9 & obs_y'=1) | (obs_x'=9 & obs_y'=2) | (obs_x'=9 & obs_y'=3))

& []((obs_x=1 & obs_y=2) | (obs_x=2 & obs_y=2) | (obs_x=3 & obs_y=2) | (obs_x=4 & obs_y=2) | (obs_x=5 & obs_y=2) | (obs_x=6 & obs_y=2) | (obs_x=7 & obs_y=2) | (obs_x=8 & obs_y=2) | (obs_x=9 & obs_y=2) | (obs_x=3 & obs_y=0) | (obs_x=3 & obs_y=1) | (obs_x=3 & obs_y=2) | (obs_x=3 & obs_y=3) | (obs_x=6 & obs_y=0) | (obs_x=6 & obs_y=1) | (obs_x=6 & obs_y=2) | (obs_x=6 & obs_y=3) | (obs_x=9 & obs_y=0) | (obs_x=9 & obs_y=1) | (obs_x=9 & obs_y=2) | (obs_x=9 & obs_y=3))
& []!(obs_x=1 & x=1 & obs_y=2 & y=2)
& []!(obs_x=2 & x=2 & obs_y=2 & y=2)
& []!(obs_x=3 & x=3 & obs_y=2 & y=2)
& []!(obs_x=4 & x=4 & obs_y=2 & y=2)
& []!(obs_x=5 & x=5 & obs_y=2 & y=2)
& []!(obs_x=6 & x=6 & obs_y=2 & y=2)
& []!(obs_x=7 & x=7 & obs_y=2 & y=2)
& []!(obs_x=8 & x=8 & obs_y=2 & y=2)
& []!(obs_x=9 & x=9 & obs_y=2 & y=2)
& []!(obs_x=3 & x=3 & obs_y=0 & y=0)
& []!(obs_x=3 & x=3 & obs_y=1 & y=1)
& []!(obs_x=3 & x=3 & obs_y=2 & y=2)
& []!(obs_x=3 & x=3 & obs_y=3 & y=3)
& []!(obs_x=6 & x=6 & obs_y=0 & y=0)
& []!(obs_x=6 & x=6 & obs_y=1 & y=1)
& []!(obs_x=6 & x=6 & obs_y=2 & y=2)
& []!(obs_x=6 & x=6 & obs_y=3 & y=3)
& []!(obs_x=9 & x=9 & obs_y=0 & y=0)
& []!(obs_x=9 & x=9 & obs_y=1 & y=1)
& []!(obs_x=9 & x=9 & obs_y=2 & y=2)
& []!(obs_x=9 & x=9 & obs_y=3 & y=3)
;
#ENVGOAL: []<>((obs_x=3 & obs_y=0) | (obs_x=3 & obs_y=1) | (obs_x=3 & obs_y=3) | (obs_x=6 & obs_y=0) | (obs_x=6 & obs_y=1) | (obs_x=6 & obs_y=3) | (obs_x=9 & obs_y=0) | (obs_x=9 & obs_y=1) | (obs_x=9 & obs_y=3) | (obs_x=1 & obs_y=2) | (obs_x=3 & obs_y=2) | (obs_x=4 & obs_y=2) | (obs_x=6 & obs_y=2) | (obs_x=7 & obs_y=2) | (obs_x=9 & obs_y=2));
ENVGOAL: []<>((obs_x=3 & obs_y=0) | (obs_x=3 & obs_y=1) | (obs_x=3 & obs_y=3) | (obs_x=6 & obs_y=0) | (obs_x=6 & obs_y=1) | (obs_x=6 & obs_y=3) | (obs_x=9 & obs_y=0) | (obs_x=9 & obs_y=1) | (obs_x=9 & obs_y=3));

SYSINIT: x=7 & y=2;

SYSTRANS:
  []((x=0) -> (x'=0 | x'=1))
& []((x=1) -> (x'=0 | x'=1 | x'=2))
& []((x=2) -> (x'=1 | x'=2 | x'=3))
& []((x=3) -> (x'=2 | x'=3 | x'=4))
& []((x=4) -> (x'=3 | x'=4 | x'=5))
& []((x=5) -> (x'=4 | x'=5 | x'=6))
& []((x=6) -> (x'=5 | x'=6 | x'=7))
& []((x=7) -> (x'=6 | x'=7 | x'=8))
& []((x=8) -> (x'=7 | x'=8 | x'=9))
& []((x=9) -> (x'=8 | x'=9 | x'=10))
& []((x=10) -> (x'=9 | x'=10 | x'=11))
& []((x=11) -> (x'=10 | x'=11 | x'=12))
& []((x=12) -> (x'=11 | x'=12 | x'=13))
& []((x=13) -> (x'=12 | x'=13 | x'=14))
& []((x=14) -> (x'=13 | x'=14 | x'=15))
& []((x=15) -> (x'=14 | x'=15))

& []((y=0) -> (y'=0 | y'=1))
& []((y=1) -> (y'=0 | y'=1 | y'=2))
& []((y=2) -> (y'=1 | y'=2 | y'=3))
& []((y=3) -> (y'=2 | y'=3 | y'=4))
& []((y=4) -> (y'=3 | y'=4 | y'=5))
& []((y=5) -> (y'=4 | y'=5 | y'=6))
& []((y=6) -> (y'=5 | y'=6 | y'=7))
& []((y=7) -> (y'=6 | y'=7))

& []((x=0 & x'=0) | (x=1 & x'=1) | (x=2 & x'=2) | (x=3 & x'=3) | (x=4 & x'=4) | (x=5 & x'=5) | (x=6 & x'=6) | (x=7 & x'=7) | (x=8 & x'=8) | (x=9 & x'=9) | (x=10 & x'=10) | (x=11 & x'=11) | (x=12 & x'=12) | (x=13 & x'=13) | (x=14 & x'=14) | (x=15 & x'=15) | (y=0 & y'=0) | (y=1 & y'=1) | (y=2 & y'=2) | (y=3 & y'=3) | (y=4 & y'=4) | (y=5 & y'=5) | (y=6 & y'=6) | (y=7 & y'=7))

& []!(obs_x'=1 & x'=1 & obs_y'=2 & y'=2)
& []!(obs_x'=2 & x'=2 & obs_y'=2 & y'=2)
& []!(obs_x'=3 & x'=3 & obs_y'=2 & y'=2)
& []!(obs_x'=4 & x'=4 & obs_y'=2 & y'=2)
& []!(obs_x'=5 & x'=5 & obs_y'=2 & y'=2)
& []!(obs_x'=6 & x'=6 & obs_y'=2 & y'=2)
& []!(obs_x'=7 & x'=7 & obs_y'=2 & y'=2)
& []!(obs_x'=8 & x'=8 & obs_y'=2 & y'=2)
& []!(obs_x'=9 & x'=9 & obs_y'=2 & y'=2)
& []!(obs_x'=3 & x'=3 & obs_y'=0 & y'=0)
& []!(obs_x'=3 & x'=3 & obs_y'=1 & y'=1)
& []!(obs_x'=3 & x'=3 & obs_y'=2 & y'=2)
& []!(obs_x'=3 & x'=3 & obs_y'=3 & y'=3)
& []!(obs_x'=6 & x'=6 & obs_y'=0 & y'=0)
& []!(obs_x'=6 & x'=6 & obs_y'=1 & y'=1)
& []!(obs_x'=6 & x'=6 & obs_y'=2 & y'=2)
& []!(obs_x'=6 & x'=6 & obs_y'=3 & y'=3)
& []!(obs_x'=9 & x'=9 & obs_y'=0 & y'=0)
& []!(obs_x'=9 & x'=9 & obs_y'=1 & y'=1)
& []!(obs_x'=9 & x'=9 & obs_y'=2 & y'=2)
& []!(obs_x'=9 & x'=9 & obs_y'=3 & y'=3)

& []!(x'=2 & y'=0)
& []!(x'=2 & y'=1)
& []!(x'=2 & y'=3)
& []!(x'=2 & y'=4)
& []!(x'=2 & y'=5)
& []!(x'=2 & y'=6)
& []!(x'=2 & y'=7)
& []!(x'=5 & y'=0)
& []!(x'=5 & y'=1)
& []!(x'=5 & y'=3)
& []!(x'=5 & y'=4)
& []!(x'=5 & y'=5)
& []!(x'=5 & y'=6)
& []!(x'=5 & y'=7)
& []!(x'=8 & y'=0)
& []!(x'=8 & y'=1)
& []!(x'=8 & y'=3)
& []!(x'=8 & y'=4)
& []!(x'=8 & y'=5)
& []!(x'=8 & y'=6)
& []!(x'=8 & y'=7)

& []!(x=2 & y=0)
& []!(x=2 & y=1)
& []!(x=2 & y=3)
& []!(x=2 & y=4)
& []!(x=2 & y=5)
& []!(x=2 & y=6)
& []!(x=2 & y=7)
& []!(x=5 & y=0)
& []!(x=5 & y=1)
& []!(x=5 & y=3)
& []!(x=5 & y=4)
& []!(x=5 & y=5)
& []!(x=5 & y=6)
& []!(x=5 & y=7)
& []!(x=8 & y=0)
& []!(x=8 & y=1)
& []!(x=8 & y=3)
& []!(x=8 & y=4)
& []!(x=8 & y=5)
& []!(x=8 & y=6)
& []!(x=8 & y=7)

& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=1 & y'=2 & obs_x=1 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=2 & y'=2 & obs_x=2 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=4 & y'=2 & obs_x=4 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=5 & y'=2 & obs_x=5 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=7 & y'=2 & obs_x=7 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=8 & y'=2 & obs_x=8 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=3 & y'=0 & obs_x=3 & obs_y=0 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=3 & y'=1 & obs_x=3 & obs_y=1 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=3 & y'=2 & obs_x=3 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=3 & y'=3 & obs_x=3 & obs_y=3 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=6 & y'=0 & obs_x=6 & obs_y=0 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=6 & y'=1 & obs_x=6 & obs_y=1 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=6 & y'=2 & obs_x=6 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=6 & y'=3 & obs_x=6 & obs_y=3 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=9 & y'=0 & obs_x=9 & obs_y=0 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=9 & y'=1 & obs_x=9 & obs_y=1 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=9 & y'=2 & obs_x=9 & obs_y=2 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=1 & y=2 & obs_x'=1 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=2 & y=2 & obs_x'=2 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=4 & y=2 & obs_x'=4 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=5 & y=2 & obs_x'=5 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=7 & y=2 & obs_x'=7 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=8 & y=2 & obs_x'=8 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=3 & y=0 & obs_x'=3 & obs_y'=0)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=3 & y=1 & obs_x'=3 & obs_y'=1)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=3 & y=2 & obs_x'=3 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=3 & y=3 & obs_x'=3 & obs_y'=3)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=6 & y=0 & obs_x'=6 & obs_y'=0)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=6 & y=1 & obs_x'=6 & obs_y'=1)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=6 & y=2 & obs_x'=6 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=6 & y=3 & obs_x'=6 & obs_y'=3)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=9 & y=0 & obs_x'=9 & obs_y'=0)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=9 & y=1 & obs_x'=9 & obs_y'=1)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=9 & y=2 & obs_x'=9 & obs_y'=2)
& []!(x'=9 & y'=3 & obs_x=9 & obs_y=3 & x=9 & y=3 & obs_x'=9 & obs_y'=3)
;

SYSGOAL: []<>(x=7 & y=1);
