* EE214 Design Project
* Name 1: Joe Example
* Name 2: John Doe

******************************************************
*Test parameters (will be used by testbench ota_test.sp
******************************************************
* capacitor sizes
.param cs=4p
.param cl=2p
.param cf=2p
* input common mode
.param input_common=1.1

* differential input voltage step
.param input_diff=0.5
******************************************************


********************TELESCOPIC**********************
********************TELESCOPIC**********************

.subckt ota vip vim vop vom vdd 

*ib
ib vdd pib 0.2m
m01 pib pib 0 0 nch214 w=28um l=0.6um

*2nd Branch
*mbb3 pa vbb1 vdd vdd pch214 w=140um l=0.7um
mbb1 vbb1 vbb1 vdd vdd pch214 w=28um l=0.7um
m02 vbb1 pib 0 0 nch214 w=28um l=0.6um M=5

*3rd Branch
mc2 pb vbias vdd vdd pch214 w=28um l=0.7um M=5
mc1 vbias vbb1 pb vdd pch214 w=28um l=0.7um M=5
m03 vbias pib 0 0 nch214 w=28um l=0.6um M=5

*4th Branch
m3 pc vbias vdd vdd pch214 w=28um l=0.7um M=5
m3a vop vbb1 pc vdd pch214 w=28um l=0.7um M=5
m1a vop vbb2 pf 0 nch214 w=28um l=0.4um M=10
m1 pf vim p 0 nch214 w=28um l=0.4um M=5

*5th Branch
mbb4 pd vbias vdd vdd pch214 w=28um l=0.7um M=2
mbb2 vbb2 vbb1 pd vdd pch214 w=28um l=0.7um M=2
mb2 vbb2 vbb2 ph 0 nch214 w=28um l=0.4um M=5
mb1 ph vbb2 p 0 nch214 w=7um l=0.4um
m0 p pib 0 0 nch214 w=28um l=0.6um M=12
*Vbb2 vbb2 0 0.6
*VP P 0 0.3

*6th Branch
m4 pe vbias vdd vdd pch214 w=28um l=0.7um M=5
m4a vom vbb1 pe vdd pch214 w=28um l=0.7um M=5
m2a vom vbb2 pg 0 nch214 w=28um l=0.4um M=10
m2 pg vip p 0 nch214 w=28um l=0.4um M=5

*2rd Stage
* m5 ps1 vbias vdd vdd pch214 w=140um l=0.7um
* m5a vom vbb1 ps1 vdd pch214 w=140um l=0.7um
* ms1 vom vom1 0 0 nch214 w=140um l=0.4um

* m6 ps3 vbias vdd vdd pch214 w=140um l=0.7um
* m6a vop vbb1 ps3 vdd pch214 w=140um l=0.7um
* ms2 vop vop1 0 0 nch214 w=140um l=0.4um

x1 vid voc vop vom diffsense
v1 vocdes 0 1.5
g1 0 p vocdes voc  50m
.ends