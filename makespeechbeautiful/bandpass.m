function  Hd = bandpass(Fs  )

Fs2=Fs/2;                                  % 奈奎斯特频率
%% 带通滤波器

fs1=60;                                   % 1 起点
fp1=120;                                   % 1终点
fp2=16000;                                   % 2 起点
fs2=Fs2;                                   % 2 终点
ws1 = fs1*pi/Fs2; wp1 = fp1*pi/Fs2;        % 通带和阻带归一化角频率
wp2 = fp2*pi/Fs2; ws2 = fs2*pi/Fs2;
tr_width = min((wp1-ws1),(ws2-wp2));       % 过渡带宽Δω的计算
M = ceil(6.2*pi/tr_width);                 % 按海明窗计算所需的滤波器阶数N
M=M+mod(M+1,2); 
wc1 = (ws1+wp1)/2; wc2 = (wp2+ws2)/2;      % 求截止频率的归一化角频率
fc1 = wc1/pi; fc2=wc2/pi;                  % 求截止频率归一化值
%h1 = fir1(M-1,[fc1 fc2],hanning(M)');      % 用fir1函数计算理想滤波器脉冲响应
h1 = fir1(1000,[fc1 fc2],hanning(1001)'); 


%% 高通滤波器 阶数2000太高
if 0 
    % N=2000;
    % wind = (hamming(N+1))';          % 海明窗计算
    % Wn=50 /Fs2;                    % 计算截止频率
    % h1=fir1( N, Wn,'high',wind);               % 用fir1函数设计FIR第1类滤波器

end



Hd = dfilt.dffir(h1);

%%  作图
if 0
    
   [db1,mag,pha,grd,w1] = freqz_m(h1,1);    % 求出频域响应
    figure
    plot(w1*Fs2/pi,db1,'k');
    grid on    
    
end
    





end
