%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%  
%     
%
%  
%  
%   标准EQ频段标：
%   1     2     3      4      5     6      7        8      9       10
%   31   62   125    250    500    1000   2000    4000    8000    16000
%
%  
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

clear;

[X, Fs]= audioread('/Users/momo/Desktop/vb/beauty_data/m_test/experiment1017/Male_5.wav');
%sound(X,Fs);

HdBp = bandpass(Fs ) ;                              % 预处理
%fvtool(HdBp);
x= filter(HdBp,X) ;
% sound(x,Fs);


%delayed=delay(x , 0.4 , 0.145 , 0.2 ,  Fs);        % 前期反射
%sound(delayed ,Fs);                                % arg： 1 输入信号 2干湿混合比 3 延迟 4  反馈能量
%tailed = tail (x ,);                              % 后期反射 混响里面的飘渺风格

%reverb = x ;

HdFirpm1  =  firpmfilter(Fs  ,250 , 500 ,0.1) ;                         % EQ
%fvtool(HdFirpm);
Y1 = filter(HdFirpm1 , x) ;

HdFirpm  =  firpmfilter(Fs  ,4000 , 8000 ,0.1) ; 
Y = filter(HdFirpm, Y1) ;

 W = tailtest (Y , Fs ) ;

 W = W./max(W) *4/5 ;
% pause
 sound(W,Fs);
 
audiowrite('/Users/momo/Desktop/vb/beauty_data/m_test/experiment1017/result/Male_5er.wav',W ,Fs)
%audiowrite('125250.10400080000.1.wav',Y,Fs);

