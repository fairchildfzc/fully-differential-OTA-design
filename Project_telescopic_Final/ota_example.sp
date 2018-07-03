* EE214 Design Project
* Name 1: Joe Example
* Name 2: John Doe

******************************************************
*Test parameters (will be used by testbench ota_test.sp
******************************************************
* capacitor sizes
.param cs=8.5p
.param cl=2p
*.param cf=2p
* input common mode
.param input_common=0.83

* differential input voltage step
.param input_diff=0.85
******************************************************


********************TELESCOPIC**********************
********************TELESCOPIC**********************

.subckt ota vip vim vop vom vdd 

*ib
ib vdd pib 0.1075m
m01 pib pib 0 0 nch214 w=100um l=1.1um
*Rnoi pib 0 0
*Cnoi vdd pib 1
*2nd Branch
*mbb3 pa vbb1 vdd vdd pch214 w=100um l=1.1um M=5
mbb1 vbb1 vbb1 vdd vdd pch214 w=400um l=1.1um
m02 vbb1 pib 0 0 nch214 w=400um l=1.1um M=5

*3rd Branch
mc2 pb vbias vdd vdd pch214 w=400um l=1.1um M=5
mc1 vbias vbb1 pb vdd pch214 w=400um l=1.1um M=5
m03 vbias pib 0 0 nch214 w=400um l=1.1um M=5

*4th Branch
m3 pc vbias vdd vdd pch214 w=400um l=1.1um M=5
m3a vop vbb1 pc vdd pch214 w=400um l=1.1um M=5
m1a vop vbb2 pf 0 nch214 w=100um l=0.65um M=10
m1 pf vim p 0 nch214 w=100um l=0.65um M=10
*Cpc pc vdd 10p

*5th Branch
mbb4 pd vbias vdd vdd pch214 w=400um l=1.1um M=2
mbb2 vbb2 vbb1 pd vdd pch214 w=400um l=1.1um M=2
mb2 vbb2 vbb2 ph 0 nch214 w=100um l=0.65um M=5
mb1 ph vbb2 p 0 nch214 w=50um l=0.65um
m0 p pib 0 0 nch214 w=400um l=1.1um M=12
*Rnoi p 0 0
*Vbb2 vbb2 0 1.0
*VP P 0 0.3
*Cp p 0 10p

*6th Branch
m4 pe vbias vdd vdd pch214 w=400um l=1.1um M=5
m4a vom vbb1 pe vdd pch214 w=400um l=1.1um M=5
m2a vom vbb2 pg 0 nch214 w=100um l=0.65um M=10
m2 pg vip p 0 nch214 w=100um l=0.65um M=10
*Cpe pe vdd 10p

*2rd Stage
* m5 ps1 vbias vdd vdd pch214 w=1100um l=1.1um
* m5a vom vbb1 ps1 vdd pch214 w=1100um l=1.1um
* ms1 vom vom1 0 0 nch214 w=1100um l=0.65um

* m6 ps3 vbias vdd vdd pch214 w=1100um l=1.1um
* m6a vop vbb1 ps3 vdd pch214 w=1100um l=1.1um
* ms2 vop vop1 0 0 nch214 w=1100um l=0.65um

x1 vid voc vop vom diffsense
v1 vocdes 0 1.45
g1 0 p vocdes voc  70m
.ends