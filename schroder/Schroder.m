function y=Schroder(x,Fs,T60, gain, gaincoff, k, delayTime, LRTime, mix, b)

% Schroders reverberation algorithm, values after Moorer

% T60 - the "DC" reverberation time in the comb filters
% g	- feedback gain in the all pass filter

% k	- how much longer the file should be made in seconds 

% delayTime - delay in ms
% gL - 

% offsetAP
% mix - mix of original and delayed sound, 0=only original, 1=only delayed
% b - 
% 

K=round(k*Fs);	 
x=[x;zeros(K,1)];

% a=zeros(1,max(n));
% b=1;
% a(n)=aCoeff ;
% x=filter(a,b,x);

a=1;
% x=filter(b, a,x);

mixComb=1;
kComb=1;
z1=delayfblp1(x,delayTime(1),T60,gaincoff(1),    kComb,   mixComb,Fs);
z2=delayfblp1(x,delayTime(2),T60,gaincoff(2),    kComb,   mixComb,Fs);
z3=delayfblp1(x,delayTime(3),T60,gaincoff(3),    kComb,   mixComb,Fs);
z4=delayfblp1(x,delayTime(4),T60,gaincoff(4),    kComb,   mixComb,Fs);
z5=delayfblp1(x,delayTime(5),T60,gaincoff(5),    kComb,   mixComb,Fs);
z6=delayfblp1(x,delayTime(6),T60,gaincoff(6),    kComb,   mixComb,Fs);
 
z=z1+z2(1:length(z1))+z3(1:length(z1))+z4(1:length(z1))+z5(1:length(z1))+z6(1:length(z1));

bufflong=1;
r=allpass12(x,LRTime,gain,bufflong,Fs);

y=mix*r(1:length(x))+(1-mix)*x;
y=y*max(abs(x))/max(abs(y));	%prevents overload distortion




