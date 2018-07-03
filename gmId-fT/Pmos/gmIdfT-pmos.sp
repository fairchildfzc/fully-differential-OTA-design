tran loop analysis

.option post brief dccap

.param vt=-774.7170m
Vdd vdd 0 3
Mp1 d g vdd vdd pch214 L=0.7u W=10u
vgs g vdd dc 'vt-0.1'
vds d vdd dc -1.5

.op
.dc vgs 'vt' -2V  10mv
.probe ft = par('((1/(2*3.142))*gmo(Mp1))/(-cgsbo(Mp1))')
.probe p2 = par('gmo(Mp1)/I(vds)')

.lib 'ee214_hspice.txt' nominal
.end
