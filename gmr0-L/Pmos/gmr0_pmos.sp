* gm*r0 vs. vds
* Zichen Fan
* vt measured using .op run
.param vt1=-774.7170m
.param vt2=-781.1738m
.param vt3=-787.4727m
.param vt4=-792.3627m
.param vt5=-796.1602m

mp1 d g1 vdd vdd pch214 L=0.7um W=10um
mp2 d g2 vdd vdd pch214 L=0.75um W=10um
mp3 d g3 vdd vdd pch214 L=0.8um W=10um
mp4 d g4 vdd vdd pch214 L=0.85um W=10um
mp5 d g5 vdd vdd pch214 L=0.9um W=10um
vg1 g1 vdd dc 'vt1-0.2'
vg2 g2 vdd dc 'vt2-0.2'
vg3 g3 vdd dc 'vt3-0.2'
vg4 g4 vdd dc 'vt4-0.2'
vg5 g5 vdd dc 'vt5-0.2'
vd d vdd dc -1.5
Vdd vdd 0 dc 3
.op
.dc vd -3.3 0  10mV
.probe av1 = par('gmo(mp1)/gdso(mp1)')
.probe av2 = par('gmo(mp2)/gdso(mp2)')
.probe av3 = par('gmo(mp3)/gdso(mp3)')
.probe av4 = par('gmo(mp4)/gdso(mp4)')
.probe av5 = par('gmo(mp5)/gdso(mp5)')

.option post brief runlvl=6
.lib 'ee214_hspice.txt' nominal
.end