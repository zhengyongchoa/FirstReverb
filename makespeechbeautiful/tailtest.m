function  W = tailtest (x , Fs )

[RIR, ~]= audioread('/Church.wav');
% minT =  Fs * 0.5 ;              % 截取前期反射，保留后期反射
% L = 1000 ;                    % 给前期反射留下时间空余
% rir = RIR(minT :(end-minT) ,1);
% 
% rir(1:L,1) = zeros(L ,1) ;

RIR1000 = zeros(length(RIR) , 1);


    for i=1 : 1000: length(RIR)

        RIR1000(i) =RIR(i) ;
   

    end


    for i=Fs*0.5 : 500 : length(RIR)

        RIR1000(i) =RIR(i) ;
 

    end
    
reve= conv(RIR1000 , x);    % 后期回声

yanchi = 0.15 ;
T = yanchi * Fs ;
feedback = 0.2 ;
y = [zeros(T,1); x(1:end); zeros(5*Fs-T,1)];
%depth  = 0.4 ;
for n = 1:3
    
    y=y + feedback * [ zeros(T*n,1) ; y(1:end-T*n)];
    feedback=feedback^2;
    
end

l1= length(x) ;
% l2 = length(y) ;
% l3 = length(reve) ;

y_w = y(1:l1,1) ;
reve_w = reve(1:l1 ,1) ;

W = 1*x + 0.1*y_w + 2*reve_w  ;



end