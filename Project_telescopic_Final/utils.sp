.subckt balun vdm vcm vp vm
e1 vp vcm transformer vdm 0 2
e2 vcm vm transformer vdm 0 2
.ends balun

.subckt diffsense vd vc vp vm
e1 vminv  0 vm 0      -1
e2 vc     0 vp vminv  0.5
e3 vd     0 vp vm     1
* These resistors help suppress "singular node" warnings
rdum1 vd  0   1gig
rdum2 vc  0   1gig
.ends diffsense

.subckt diffdrive vp vm vd vc
e1 vp vc vd 0  0.5
e2 vm vc vd 0  -0.5
.ends diffdrive

.subckt looptest x y ai=0 av=0
vx middle x  dc 0
vy middle y  ac 'av'
it 0 middle  ac 'ai'
.ends looptest

.subckt difflooptest xp xm yp ym ai=0 av=0
vxp middlep xp  dc 0
vyp middlep yp  ac 'av'
vxm middlem xm  ac 'av'
vym middlem ym  dc 0
it  middlem middlep  ac 'ai'
.ends difflooptest
