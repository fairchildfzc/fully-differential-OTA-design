clear all;
% load signals from first run and calculate Ti
m = loadsig('gmIdft-nmos.sw0');
%m = loadsig('ota2_example_test.ac0');

lssig(m)
ft = evalsig(m, 'ft')/1e9;
p2 = -evalsig(m, 'p2');
c=evalsig(m,'cgsbo_mn1');
gm=evalsig(m,'gmo_mn1');
figure;
plot(p2, ft, 'linewidth', 2);
set(gca,'FontSize',14);
set(gca,'FontName','Arial');
set(gca,'LineWidth',1.5);
%axis([5 15 0 30]);
grid;
xlabel('g_m/I_d[V^{-1}]');
ylabel('f_T[GHz]');



