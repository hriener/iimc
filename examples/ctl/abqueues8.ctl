#PASS: (0-7)
AG AF(dataOut7<2> | dataOut7<1> | dataOut7<0>)
AG AF(dataOut6<2> | dataOut6<1> | dataOut6<0>)
AG AF(dataOut5<2> | dataOut5<1> | dataOut5<0>)
AG AF(dataOut4<2> | dataOut4<1> | dataOut4<0>)
AG AF(dataOut3<2> | dataOut3<1> | dataOut3<0>)
AG AF(dataOut2<2> | dataOut2<1> | dataOut2<0>)
AG AF(dataOut1<2> | dataOut1<1> | dataOut1<0>)
AG AF(dataOut0<2> | dataOut0<1> | dataOut0<0>)
#PASS: (8)
AG EF(empty<7> & empty<6> & empty<5> & empty<4> & empty<3> & empty<2> & empty<1> & empty<0>)
#PASS: (9)
AG EF(full<7> & full<6> & full<5> & full<4> & full<3> & full<2> & full<1> & full<0>)
#FAIL: (10)
AG AF(empty<7> & empty<6> & empty<5> & empty<4> & empty<3> & empty<2> & empty<1> & empty<0>)
#FAIL: (11)
AG AF(full<7> & full<6> & full<5> & full<4> & full<3> & full<2> & full<1> & full<0>)
#PASS: (12-19)
AG AF(full<7> -> full<6>)
AG AF(full<6> -> full<5>)
AG AF(full<5> -> full<4>)
AG AF(full<4> -> full<3>)
AG AF(full<3> -> full<2>)
AG AF(full<2> -> full<1>)
AG AF(full<1> -> full<0>)
AG AF(full<7> -> full<0>)
#PASS: (20-27)
AG AF(full<0> -> full<1>)
AG AF(full<1> -> full<2>)
AG AF(full<2> -> full<3>)
AG AF(full<3> -> full<4>)
AG AF(full<4> -> full<5>)
AG AF(full<5> -> full<6>)
AG AF(full<6> -> full<7>)
AG AF(full<0> -> full<7>)
#PASS: (28-35)
AG AF(empty<7> -> empty<6>)
AG AF(empty<6> -> empty<5>)
AG AF(empty<5> -> empty<4>)
AG AF(empty<4> -> empty<3>)
AG AF(empty<3> -> empty<2>)
AG AF(empty<2> -> empty<1>)
AG AF(empty<1> -> empty<0>)
AG AF(empty<7> -> empty<0>)
#PASS: (36-43)
AG AF(empty<0> -> empty<1>)
AG AF(empty<1> -> empty<2>)
AG AF(empty<2> -> empty<3>)
AG AF(empty<3> -> empty<4>)
AG AF(empty<4> -> empty<5>)
AG AF(empty<5> -> empty<6>)
AG AF(empty<6> -> empty<7>)
AG AF(empty<0> -> empty<7>)
#PASS: (44-51)
AG(full<0> -> AF(dataOut1<2> | dataOut1<1> | dataOut1<0>))
AG(full<1> -> AF(dataOut2<2> | dataOut2<1> | dataOut2<0>))
AG(full<2> -> AF(dataOut3<2> | dataOut3<1> | dataOut3<0>))
AG(full<3> -> AF(dataOut4<2> | dataOut4<1> | dataOut4<0>))
AG(full<4> -> AF(dataOut5<2> | dataOut5<1> | dataOut5<0>))
AG(full<5> -> AF(dataOut6<2> | dataOut6<1> | dataOut6<0>))
AG(full<6> -> AF(dataOut7<2> | dataOut7<1> | dataOut7<0>))
AG(full<0> -> AF(dataOut7<2> | dataOut7<1> | dataOut7<0>))
#FAIL: (52)
AG(full<0> -> AF(dataOut1<1> | dataOut1<0>))
#FAIL: (53)
AG(empty<0> -> AF empty<1>)
#FAIL: (54)
AG(full<0> -> AF full<1>)
#FAIL: (55-62)
AG((dataOut7<2> & ~dataOut7<1> & dataOut7<0>) -> AX AF(dataOut7<2> & ~dataOut7<1> & dataOut7<0>))
AG((dataOut6<2> & ~dataOut6<1> & dataOut6<0>) -> AX AF(dataOut6<2> & ~dataOut6<1> & dataOut6<0>))
AG((dataOut5<2> & ~dataOut5<1> & dataOut5<0>) -> AX AF(dataOut5<2> & ~dataOut5<1> & dataOut5<0>))
AG((dataOut4<2> & ~dataOut4<1> & dataOut4<0>) -> AX AF(dataOut4<2> & ~dataOut4<1> & dataOut4<0>))
AG((dataOut3<2> & ~dataOut3<1> & dataOut3<0>) -> AX AF(dataOut3<2> & ~dataOut3<1> & dataOut3<0>))
AG((dataOut2<2> & ~dataOut2<1> & dataOut2<0>) -> AX AF(dataOut2<2> & ~dataOut2<1> & dataOut2<0>))
AG((dataOut1<2> & ~dataOut1<1> & dataOut1<0>) -> AX AF(dataOut1<2> & ~dataOut1<1> & dataOut1<0>))
AG((dataOut0<2> & ~dataOut0<1> & dataOut0<0>) -> AX AF(dataOut0<2> & ~dataOut0<1> & dataOut0<0>))