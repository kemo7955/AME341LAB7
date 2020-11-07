clear;clc;close all
% -------------------------- Import Data ---------------------------
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

%% idk anymore
figure()
hold on; grid on
plot(sinwave777(:,1),sinwave777(:,2),'--k')
plot(triangle33(:,1),triangle33(:,2),'--k')
plot(part32000(:,1),part32000(:,2),'-b','LineWidth',1.25)