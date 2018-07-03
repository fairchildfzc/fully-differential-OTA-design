addpath('C:\Program Files\MATLAB\HspiceToolbox')

% load signals from first run and calculate Ti
m = loadsig('gmIDW-pmos.sw0');
%m = loadsig('ota2_example_test.ac0');

lssig(m)
p1 = -evalsig(m, 'p1');
p2 = -evalsig(m, 'p2');
figure(1);
plot(-p2, -p1, 'linewidth', 2);
set(gca,'FontSize',14);
set(gca,'FontName','Arial');
set(gca,'LineWidth',1.5);
axis([5 15 0 15]);
grid;
xlabel('g_m/I_d[V^{-1}]');
ylabel('I_d/W[uA/um]');



