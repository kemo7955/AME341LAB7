clear;clc;close all
% -------------------------- Import Data ------------------
% data(:,1) = time/freq
% data(:,2) = power/voltage
part1sin = importdata('Data Lab 7/Part1_sin.txt').data;
part1square = importdata('Data Lab 7/Part1_square.txt').data;
part2sin = importdata('Data Lab 7/Part2_sin.txt').data;
part2sinAliasing = importdata('Data Lab 7/Part2_sinAliasing.txt').data;
part2Final = importdata('Data Lab 7/Part2_timeDomainFinal.txt').data;
part2Initial = importdata('Data Lab 7/Part2_timeDomainInitial.txt').data;
part2Freq = importdata('Data Lab 7/Part2_timeDomainFreqChange.txt').data;
part31000 = importdata('Data Lab 7/Part3_1000Hz.txt').data;
part32000 = importdata('Data Lab 7/Part3_2000Hz.txt').data;
part3time = importdata('Data Lab 7/Part3_timeDomain.txt').data;
sinwave777 = importdata('Data Lab 7/sinwave_777Hz.txt').data;
triangle33 = importdata('Data Lab 7/triangle_33Hz.txt').data;

%% Figures From Part 1
% --------------- Part 1 Sine Wave ------------------------
clear h
[h,~] = getFundamental(part1sin)
figure()
hold on;
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plt = plot(part1sin(:,1),part1sin(:,2),'k');
line = xline(h,'--r');
xlabel('$f$ [Hz]');
ylabel('Power [dB]');
legend([plt,line],{'Signal','Fundamental $f$'},'Interpreter','latex')


% --------------- Part 1 Square Wave ----------------------
clear h
[h,~] = getHarmonics(part1square)
figure()
hold on;
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plt = plot(part1square(:,1),part1square(:,2),'k');
for i=1:length(h)
    line = xline(h(i),'--r');
end
xlabel('$f$ [Hz]');
ylabel('Power [dB]');
legend([plt,line],{'Signal','Harmonic $f$'},'Interpreter','latex')

%% Figures From Part 2
% ---------------- Sine Wave at 10kHz Sampling Rate -------
clear h
[h,~] = getFundamental(part2sin)
figure()
hold on; 
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plt = plot(part2sin(:,1),part2sin(:,2),'k');
line = xline(h,'--r');
xlabel('$f$ [Hz]');
xlim([0 1700])
ylabel('Power [dB]');
legend([plt,line],{'Signal','Fundamental $f$'},'Interpreter','latex',...
    'location','best')

% ---------- Sine Wave at 2.5kHz Sampling Rate ------------
clear h
[h,~] = getFundamental(part2sinAliasing)
figure()
hold on;
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plt = plot(part2sinAliasing(:,1),part2sinAliasing(:,2),'k');
line = xline(h,'--r');
xlabel('$f$ [Hz]');
xlim([0 1700])
ylabel('Power [dB]');
legend([plt,line],{'Signal','Fundamental $f$'},'Interpreter','latex',...
    'location','best')

% ---------------- Sine Wave time domain initial -------
figure()
hold on; 
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plot(part2Initial(:,1),part2Initial(:,2),'k')
xlabel('t [s]');
xlim([0 .02])
ylabel('V');
ylim([-3 3])

% ---------------- Sine Wave time domain final ------------
figure()
hold on; 
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plot(part2Final(:,1),part2Final(:,2),'k')
xlabel('t [s]');
ylabel('V');
ylim([-3 3])
% ----- Sine wave in time domain with increase Freq -------
figure()
hold on; 
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plot(part2Freq(:,1),part2Freq(:,2),'k')
xlabel('t [s]');
ylabel('V');
ylim([-3 3])

%% Figures for part 3
% -------------- Mystery Signal in time domain ------------
figure()
hold on; 
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plot(part3time(:,1),part3time(:,2),'k')
xlim([.02 .06])
xlabel('t [s]');
ylabel('V');

% -------------- Mystery Signal f_s at 2000 Hz ------------
[h,p] = getHarmonics(part32000,length(part32000(:,1)),-60)
figure()
hold on; 
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plot(part32000(:,1),part32000(:,2),'k')
xlabel('$f$ [s]');
ylabel('Power [dB]');

% -------------- Mystery Signal f_s at 1000 Hz ------------
figure()
hold on; 
%maxPower = max(part31000(:,2))
%maxIndex = find(maxPower==part31000(:,2),1)
%maxFreq = part31000(maxIndex,1)
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plot(part31000(:,1),part31000(:,2),'k')
xlabel('$f$ [s]');
ylabel('Power [dB]');

%% The Extra Graphs
figure()
clear h p
[h,~] = getHarmonics(triangle33,length(triangle33(:,1)),-60)
[f,~] = getFundamental(sinwave777)
subplot(2,1,1)
hold on;
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plot(sinwave777(:,1),sinwave777(:,2),'k')
plt = plot(triangle33(:,1),triangle33(:,2),'k');
for i = 1:length(h)
    harm = xline(h(i),'--m');
end
line = xline(f,'--r');
xlabel('$f$ [s]');
ylabel('Power [dB]');
ylim([-125 10])
legend([plt,line,harm],{'Signal','Fundamental $f$','Harmonic $f$'},'Interpreter','latex',...
    'location','bestoutside')

clear h p
[h,~] = getHarmonics(part32000,length(part32000(:,1)),-60)
[f,~] = getFundamental(part32000)
subplot(2,1,2)
hold on;
set(gca,'defaulttextinterpreter','latex','TickLabelInterpreter','latex');
plt2 = plot(part32000(:,1),part32000(:,2));
for i = 1:length(h)
    harm2 = xline(h(i),'--m');
end
line2 = xline(f,'--r');
xlabel('$f$ [s]');
ylabel('Power [dB]');
ylim([-125 10])
legend([plt2,line2,harm2],{'Signal','Fundamental $f$','Harmonic $f$'},'Interpreter','latex',...
    'location','bestoutside')

%%
