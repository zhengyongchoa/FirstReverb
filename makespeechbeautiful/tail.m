function  [out] = tail (in,depth,delay,feedback,fs)



T = ceil(delay*fs); % delay in sec * samp/sec = samples
y = [zeros(T,1);in(1:end);zeros(64*fs-T,1)];

in=[in;zeros(64*fs,1)];

% n=1; %iterator variable for # delays
% while feedback >= 0.0001 %going to continually decrease feedback inside loop
%     delayedSignal=delayedSignal+feedback * [ zeros(sampleDelay*n,1) ; delayedSignal(1:end-sampleDelay*n)];
%     feedback=feedback^2;
%     n=n+1;
% end

for   n = 1:2
    
    y=y+feedback * [ zeros(T*n,1) ; y(1:end-T*n)];
    feedback=feedback^2;
    
end



out = in + depth*y;

% removing excess zeros from the end
content = find(out,1,'last');
out=out(1:content);


end