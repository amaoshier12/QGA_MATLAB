function X=BintoDec(binary,lenchrom,bound)
%% Binary to decimal 
%% Input
%-binary:   Binary code;
%-lenchrom: Binary length;
%-bound:    Boundary conditions;
%% output
%-X: Decimal variable;
P=length(lenchrom);
n=1;
X=zeros(1,P);
for i=1:P
    for j=lenchrom(i)-1:-1:0
        X(i)=X(i)+binary(n).*2.^j;
        n=n+1;
    end
end
X=bound(:,1)'+X./(2.^lenchrom-1).*(bound(:,2)-bound(:,1))'; 
