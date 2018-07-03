clear all;

m = loadsig('gmr0_pmos.sw0');
lssig(m)
av1 = evalsig(m, 'av1');
av2 = evalsig(m, 'av2');
av3 = evalsig(m, 'av3');
av4 = evalsig(m, 'av4');
av5 = evalsig(m, 'av5');
vd = evalsig(m, 'd');
vdd = evalsig(m, 'vdd');
figure(1);
plot(vd, av1, 'linewidth', 2);
hold on;
plot(vd, av2, 'linewidth', 2);
hold on;
plot(vd, av3, 'linewidth', 2);
hold on;
plot(vd, av4, 'linewidth', 2);
hold on;
plot(vd, av5, 'linewidth', 2);
set(gca,'FontSize',14);
set(gca,'FontName','Arial');
set(gca,'LineWidth',1.5);
%axis([3 0 0 200]);
grid on;
xlabel('V_d_s [V]');
ylabel('g_mr_0');
legend('L=0.70um','L=0.75um','L=0.80um','L=0.85um','L=0.90um')


