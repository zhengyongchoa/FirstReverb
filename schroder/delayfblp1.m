function y=delayfblp1(x, delayTime, T60, acoff, k, mix, Fs)

%Delay effect with a low pass filter in the feedback loop
%dealyTime 	- delay in ms
%T60		- reverberation time if a=0
% a         - pole placement for the low pass filter . 低通滤波器的极点位置
%k =1       - constant which tells MATLAB how much longer the signal should be. 
%		    - The signalet is made k*offset milliseconds longer, k>=1       1
%mix 		- mix original and delayed sound, 0=only original, 1=only   1
%delayed   

%Delay:		- offset>?, feedback<1

feedback=(1-acoff)*10^(-3*delayTime/(1000*T60));	%transformation reverberation time/feedback gain
l=length(x);                                    %The original length of the sound

delay=round(delayTime*Fs/1000);                  %delay in number of samples

x=[0;x;zeros(k*delay,1)];

z=zeros(size(x));

for j=1+(1:(l+(k-1)*delay))                     %For each sampel
  z(j+delay)=x(j)+feedback*(z(j)+(1-acoff)*acoff*z(j-1));
end

y=mix*z+(1-mix)*x;
y=y*max(abs(x))/max(abs(y));                %Prevents overload distortion

end