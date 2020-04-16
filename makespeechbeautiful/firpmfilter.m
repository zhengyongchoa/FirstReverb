function  Hd = firpmfilter(Fs,Fstop1 , Fpass2 , Wstop1)
% Fstop1 ： 带通起点
% Fpass2 ： 带通终点
% Wstop1 :
%     Wstop	 0.1	0.2	  0.5	  1
%     下降db	-4	  -5    -8	 -10.3
 

N   = 256;  % Order



Fpass1 = Fstop1 +10;  % First Passband Frequency
Fstop2 = Fpass2+10;  % Second Stopband Frequency
Wpass  = 1;    % Passband Weight
Wstop2 = Wstop1;    % Second Stopband Weight
dens   = 20;   % Density Factor
b  = firpm(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 0], [Wstop1 Wpass Wstop2], {dens});

Hd = dfilt.dffir(b);

%fvtool(Hd) ;
end