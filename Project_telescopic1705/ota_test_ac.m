clear all;

% load signals from first run and calculate Ti
m = loadsig('ota_test.ac0');
%m = loadsig('ota2_example_test.ac0');

lssig(m)
ti = (evalsig(m, 'I_xt_vyp')-evalsig(m, 'I_xt_vym'))./(evalsig(m, 'I_xt_vxp')-evalsig(m, 'I_xt_vxm'));

% load signals from second run and calculate Tv
m = loadsig('ota_test.ac1');
%m = loadsig('ota2_example_test.ac1');

lssig(m)
tv = -(evalsig(m, 'yp')-evalsig(m, 'ym'))./(evalsig(m, 'xp')-evalsig(m, 'xm'));

% calculate T
t  = (tv.*ti-1)./(2+tv+ti);
f = 1e-6*evalsig(m, 'HERTZ');

% extract phase and magnitude
mt = 20*log10(abs(t));
pt = 180/pi*unwrap(angle(t));

% results
fc=interp1(mt, f, 0)
pm=180+interp1(f, pt, fc)
t0=10^(mt(1)/20)

% plot
% ...

figure(1);
subplot(2,1,1)
semilogx(f, mt, 'linewidth', 2);
title(sprintf('f_c=%0.2fMHz, PM=%0.2fdeg, T_0=%0.0f', fc, pm, t0))
set(gca,'FontSize',14);
set(gca,'FontName','Arial');
set(gca,'LineWidth',1.5);
xlabel('f [MHz]');
ylabel('Magnitude [dB]');
grid;
axis([1e-2 1e4 -40 80]);
h=line([1e-2 1e4], [0 0]);
set(h, 'Linewidth', 2, 'Color', 'k');

subplot(2,1,2)
semilogx(f, pt, 'linewidth', 2);
set(gca,'FontSize',14);
set(gca,'FontName','Arial');
set(gca,'LineWidth',1.5);
xlabel('f [MHz]');
ylabel('Phase [degrees]');
axis([1e-2 1e4 -180 0]);
grid;

