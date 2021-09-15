function [Y,X]=Objectfunction(binary,lenchrom)
%% cost function
%% Input
%-binary:   Binary code;
%-lenchrom: Binary length;
%% output
%-Y: cost function value
%-X: Decimal variable 
bound=[-3.0 3;-3 4];           % Boundary conditions 
X=BintoDec(binary,lenchrom,bound); % Binary to decimal  
Y=-20*exp(-0.2*sqrt((X(1)^2+X(2)^2)/2))-exp((cos(2*pi*X(1))+cos(2*pi*X(2)))/2)+20+2.71289;
Y=-Y;% minimum
