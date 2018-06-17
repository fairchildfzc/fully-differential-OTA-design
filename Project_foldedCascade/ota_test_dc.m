clear all;

m = loadsig('ota_test.sw0');
lssig(m)
vod = evalsig(m, 'vod');
vsd = evalsig(m, 'vsd');

figure(1);
plot(vod, vod./vsd, 'linewidth', 2);
set(gca,'FontSize',14);
set(gca,'FontName','Arial');
set(gca,'LineWidth',1.5);
%axis([-3 3 0 1500]);
grid;
xlabel('V_o_d [V]');
ylabel('V_o_d/V_s_d [V/V]');


