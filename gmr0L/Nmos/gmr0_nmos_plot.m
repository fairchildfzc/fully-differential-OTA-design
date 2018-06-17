clear all;

m = loadsig('gmr0_nmos.sw0');
lssig(m)
av1 = evalsig(m, 'av1');
av2 = evalsig(m, 'av2');
av3 = evalsig(m, 'av3');
av4 = evalsig(m, 'av4');
av5 = evalsig(m, 'av5');
vd = evalsig(m, 'd');
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
axis([0 3.3 0 200]);
grid on;
xlabel('V_d_s [V]');
ylabel('g_mr_0');
legend('L=0.40um','L=0.45um','L=0.50um','L=0.55um','L=0.60um')


