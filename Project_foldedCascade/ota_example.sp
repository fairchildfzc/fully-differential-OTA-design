* EE214 Design Project
* Name 1: Joe Example
* Name 2: John Doe

******************************************************
*Test parameters (will be used by testbench ota_test.sp
******************************************************
* capacitor sizes
.param cs=400f
.param cl=5p
.param cf=100f
* input common mode
.param input_common=1

* differential input voltage step
.param input_diff=0.5
******************************************************


******************************************************
*Circuit description
******************************************************
.subckt ota vip vim vop vom vdd
.param i = 1460u
* Vcmc vcmc 0 2.14
Im0  vdd vp  'i'
Rm0  vdd vp  1gig
Im5  vx  0   'i'
Rm5  vx  0   1gig
Im6  vy  0   'i'
Rm6  vy  0   1gig
Im3  vdd vop '0.5*i'
Rm3  vdd vop 1gig
Im4  vdd vom '0.5*i'
Rm4  vdd vom 1gig
Vbb2 vbb2 0  0.9
* M0 vp vcmc vdd vdd pch214 W=60u  L=0.5u M=6
M1 vx vim  vp  vp  pch214 W=70u  L=0.9u M=10
M2 vy vip  vp  vp  pch214 W=70u  L=0.9u M=10
* cna v1m vim  7.5f
* cnb v1p vip  7.5f
M1a vop vbb2  vx  vx nch214 W=20u  L=0.65u M=7
M2a vom vbb2  vy  vy nch214 W=20u  L=0.65u M=7



* .param gm2=1.8352m
* rza vzp vop  '1/gm2'
* rzb vzm vom  '1/gm2'

x1 vid voc vop vom diffsense
v1 vocdes 0 1.5
g1 vdd vp   voc vocdes 1m

.ends
