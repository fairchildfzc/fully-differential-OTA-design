tran loop analysis

.option post brief

.param vt=-805.2867m
Vdd vdd 0 3
Mp1 d g vdd vdd pch214 L=1.15u W=10u
vgs g vdd dc 'vt-0.1'
vds d vdd dc -2.5

.op
.dc vgs 'vt' -2.5V  10mv
.probe p1 = par('I(vds)/W(Mp1)')
.probe p2 = par('gmo(Mp1)/I(vds)')

.lib 'ee214_hspice.txt' nominal
.end
