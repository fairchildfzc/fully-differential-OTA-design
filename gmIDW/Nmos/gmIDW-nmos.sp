tran loop analysis

.option post brief

.param vt=601.6155m

Mn1 d g 0 0 nch214 L=0.45u W=10u
vg g 0 dc 'vt'
vd d 0 dc 2

.op
.dc vg 'vt' 2.5V  10mv
.probe p1 = par('I(vd)/W(Mn1)')
.probe p2 = par('gmo(Mn1)/I(vd)')

.lib 'ee214_hspice.txt' nominal
.end