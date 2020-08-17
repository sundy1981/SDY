clear
load Xianyang_Daily_Runoff.txt;            
xc=Xianyang_Daily_Runoff;                   % Loading Measured Data
t=length(xc);
bc=365;                                     % bc:Slide remove step size
for ii=1:bc:t-bc
    if(j<ii)
       y(j)=xc(j);
    else
       y(j)=xc(j+bc);
    end                                     % Generating subsequences
    m=2;
    r_apen=0.15*std(y);                     % Parameter:m,r 
    apen(ii) = ApEn( m, r_apen, y, 1);      % Approximate entropy calculation
end
