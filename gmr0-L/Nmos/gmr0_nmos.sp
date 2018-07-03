* gm*r0 vs. vds
* Zichen Fan
* vt measured using .op run
.param vt1=599.0589m
.param vt2=601.6155m
.param vt3=596.8380m
.param vt4=589.0905m
.param vt5=580.4510m

mn1 d g1 0 0 nch214 L=0.4um W=10um
mn2 d g2 0 0 nch214 L=0.45um W=10um
mn3 d g3 0 0 nch214 L=0.5um W=10um
mn4 d g4 0 0 nch214 L=0.55um W=10um
mn5 d g5 0 0 nch214 L=0.6um W=10um
vg1 g1 0 dc 'vt1+0.2'
vg2 g2 0 dc 'vt2+0.2'
vg3 g3 0 dc 'vt3+0.2'
vg4 g4 0 dc 'vt4+0.2'
vg5 g5 0 dc 'vt5+0.2'
vd d 0 dc 1
.op
.dc vd 0 3.3 10mV
.probe av1 = par('gmo(mn1)/gdso(mn1)')
.probe av2 = par('gmo(mn2)/gdso(mn2)')
.probe av3 = par('gmo(mn3)/gdso(mn3)')
.probe av4 = par('gmo(mn4)/gdso(mn4)')
.probe av5 = par('gmo(mn5)/gdso(mn5)')

.option post brief runlvl=6
.lib 'ee214_hspice.txt' nominal
.end