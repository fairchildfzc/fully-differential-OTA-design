*****

.option post brief dccap

.param vt=570.8395m

Mn1 d g 0 0 nch214 L=0.45u W=10u
vg g 0 dc 'vt+0.1'
vd d 0 dc 2

.op
.dc vg 'vt+0.1' 2.5V  10mv
.probe ft = par('((1/(2*3.142))*gmo(Mn1))/(-cgsbo(Mn1))')
.probe p2 = par('gmo(Mn1)/I(vd)')

.lib 'ee214_hspice.txt' nominal
.end