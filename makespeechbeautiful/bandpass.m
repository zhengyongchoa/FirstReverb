function  Hd = bandpass(Fs  )

Fs2=Fs/2;                                  % �ο�˹��Ƶ��
%% ��ͨ�˲���

fs1=60;                                   % 1 ���
fp1=120;                                   % 1�յ�
fp2=16000;                                   % 2 ���
fs2=Fs2;                                   % 2 �յ�
ws1 = fs1*pi/Fs2; wp1 = fp1*pi/Fs2;        % ͨ���������һ����Ƶ��
wp2 = fp2*pi/Fs2; ws2 = fs2*pi/Fs2;
tr_width = min((wp1-ws1),(ws2-wp2));       % ���ɴ����صļ���
M = ceil(6.2*pi/tr_width);                 % ������������������˲�������N
M=M+mod(M+1,2); 
wc1 = (ws1+wp1)/2; wc2 = (wp2+ws2)/2;      % ���ֹƵ�ʵĹ�һ����Ƶ��
fc1 = wc1/pi; fc2=wc2/pi;                  % ���ֹƵ�ʹ�һ��ֵ
%h1 = fir1(M-1,[fc1 fc2],hanning(M)');      % ��fir1�������������˲���������Ӧ
h1 = fir1(1000,[fc1 fc2],hanning(1001)'); 


%% ��ͨ�˲��� ����2000̫��
if 0 
    % N=2000;
    % wind = (hamming(N+1))';          % ����������
    % Wn=50 /Fs2;                    % �����ֹƵ��
    % h1=fir1( N, Wn,'high',wind);               % ��fir1�������FIR��1���˲���

end



Hd = dfilt.dffir(h1);

%%  ��ͼ
if 0
    
   [db1,mag,pha,grd,w1] = freqz_m(h1,1);    % ���Ƶ����Ӧ
    figure
    plot(w1*Fs2/pi,db1,'k');
    grid on    
    
end
    





end
