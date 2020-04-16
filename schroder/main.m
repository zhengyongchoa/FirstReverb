clear ;
% (x,Fs,T60,g,gL,k,offsetComb,offsetAP,mix,n,aCoeff)

[x, Fs]= audioread('s5.wav');

T60 = 2 ;
buffTime = 2 ;
gain = 0.2;                            % feedback gain in the all pass filter
mix= 0.4;
LRTime = 0.1 ;

delayTime1 = [0.145 ,0.155 , 0.178 , 0.188  , 0.190 , 0.211 ] ;     % 延迟时间
RePower1  = [ 0.2 , 0.18  , 0.17  ,  0.16   ,  0.08 , 0.1   ] ;     % 反馈强度

 %  滤波器 filter的系数 . 5
b = [0.145  0.6  0.5  0.3 0.2] ;

y=Schroder(x,Fs,T60, gain, RePower1 , buffTime, delayTime1 , LRTime , mix , b);


 sound(Y,Fs);
audiowrite('./putaudio/1.wav',Y ,Fs)



