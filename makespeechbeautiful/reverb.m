% 
% 
% 
% 
% 

clear; clc ;clf ;


% [x , Fs] = audioread('/Users/momo/Desktop/vb/2混响git/RIRData/SmallWoodRoom.wav');
% x=x(:,1) ;
% W= resample( x , 44100 , Fs ) ;
% audiowrite('SmallWoodRoom.wav',W ,44100) ;

[RIR, rirFs]= audioread('/Church.wav');
[x , Fs] = audioread('./ns_reverb/ns_Male_5.wav');

% W = tailtest (x , Fs );
% W = W/max(W) *0.7 ;
% sound(W,Fs);
% audiowrite('./ns_reverb/rev_Male_1.wav', W , Fs);




%RIR=abs(RIR);
% y = tail( x , 0.4 , 0.16 , 0.2 , Fs) ; % 0.4 , 0.145 , 0.2 
% sound(y , Fs);

% delayed=delay(x , 0.4 , 0.145 , 0.2 ,  Fs);        % 前期反射


minT =  Fs * 0.5 ;              % 截取前期反射，保留后期反射
L = 1000 ;                    % 给前期反射留下时间空余
rir = RIR(minT :(end-minT) ,1);
t1 = length(rir) / 44100 ;
rir1 = rir(1:L,1) ;
rir(1:L,1) = zeros(L ,1) ;
%plot(rir)


RIR1000 = zeros(length(RIR) , 1);

n=1;
for i=1 : 1000: length(RIR)
    
RIR1000(i) =RIR(i) ;
n=n+1 ;

end


for i=Fs*0.5 : 500 : length(RIR)
    
RIR1000(i) =RIR(i) ;
%n=n+1 ;

end



plot(RIR1000)


tic
reve= conv(RIR1000 , x);    % 后期回声
%wcon = conv(rir, x );
c=toc ;


tic
reve1= filter(RIR1000, 1 , x);    % 后期回声
c1 = toc ;


yanchi = 0.15 ;
T = yanchi * Fs ;
feedback = 0.2 ;
y = [zeros(T,1); x(1:end); zeros(5*Fs-T,1)];
depth  = 0.4 ;
for n = 1:3
    
    y=y + feedback * [ zeros(T*n,1) ; y(1:end-T*n)];
    feedback=feedback^2;
    
end




l1= length(x) ;
l2 = length(y) ;
l3 = length(reve) ;

y_w = y(1:l1,1) ;                % ER
reve_w = reve(1:l1 ,1) ;         % LR1
 reve1_w = reve1(1:l1 ,1) ;         % LR1

W = 1*x + 0.1*y_w + 2*reve_w  ;
sound(W,Fs);


%audiowrite('Church.wav',rir(:,1), Fs) ;
%W1 =x + wcon_w ; 
 W2 = 0.8*x +reve_w;
W3 = reve_w + y_w;

audiowrite('./reverb/1024/LR/LR_Male_5.wav',reve1_w/max(reve1_w)*0.7, Fs) ;
audiowrite('./reverb/1024/ER/ER_Male_5.wav',y_w/max(y_w)*0.7, Fs) ;








