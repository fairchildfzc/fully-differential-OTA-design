% Load hspice output
m = loadsig('ota_test.ac1');

% List available signals
lssig(m)

% Read into MATLAB variables
f     = evalsig(m, 'HERTZ');
no    = evalsig(m, 'outnoise');
ni    = evalsig(m, 'innoise');
integ = cumtrapz(f, no);
integ_sqrt = 1e6*sqrt(integ);
integ_final = integ_sqrt(end);
vodpeak = 1.2;
DR = 10*log10(0.5*vodpeak^2/integ(end));

% Plot the results
figure(1);
subplot(2,1,1)
loglog(f, no, 'linewidth', 2);
set(gca,'FontSize',14);
set(gca,'FontName','Arial');
set(gca,'LineWidth',1.5);
xlabel('f [Hz]');
ylabel('PSD [V^2/Hz]');
axis([min(f) max(f) min(no)/10 10*max(no)]);
grid;

subplot(2,1,2)
semilogx(f, integ_sqrt,'linewidth', 2);
set(gca,'FontSize',14);
set(gca,'FontName','Arial');
set(gca,'LineWidth',1.5);
xlabel('f [Hz]');
ylabel('Sqrt(Integral) [\muVrms]');
axis([min(f) max(f) 0 1.2*integ_final]);
string=sprintf('Integral=%2.2fuVrms, DR=%2.2fdB (for V_o_d_m_a_x=%2.2fV)', integ_final, DR, vodpeak);
title(string);
grid;


