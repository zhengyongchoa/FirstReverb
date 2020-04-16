function  y = peakfilt( x , Wc ,Wb ,G)

V0 = 10^(G/20) ; H0 = V0 -1 ;
if G >= 0
    c =(tan(pi*Wb/2) - 1) / (tan(pi*Wb/2)+1) ;
else
   c = (tan(pi*Wb/2) - V0)/( tan(pi*Wb/2)+ V0); 
end

d = -cos(pi*Wc);
xh = [0 ,0];
for n = 1:length(x)
    
    xh_new = x(n) - d*(1-c)*xh(1) +c*xh(2);
    ap_y = -c *xh_new + d*(1-c)*xh(1) +xh(2) ;
    xh = [xh_new , xh(1)];
    y(n) = 0.5* H0*(x(n) - ap_y) +x(n) ;
    
end

end