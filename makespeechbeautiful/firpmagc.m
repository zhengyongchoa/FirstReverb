%  测试参数： 
%  firpm 滤波器
clear;

Fs = 44100;
Fstop1 = 300 ;

Fpass2 = 6000;

N     = 1006;  % Order



Fpass1 = Fstop1 +10;  % First Passband Frequency

Fstop2 = Fpass2+10;  % Second Stopband Frequency

Wstop1 = 0.05;    % First Stopband Weight  决定衰减比率
Wpass  = 1;      % Passband Weight      越大越平稳
Wstop2 = 0.05;    % Second Stopband Weight 0.2 ：

dens   = 200;   % Density Factor

b  = firpm(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 0], [Wstop1 Wpass Wstop2], {dens});


Hd = dfilt.dffir(b);

fvtool(Hd) ;