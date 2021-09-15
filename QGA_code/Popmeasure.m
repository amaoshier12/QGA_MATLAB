function binary=Popmeasure(chrom)
%% Population measuremen
%-chrom:  Qubit encoding matrix
%-binary: Binary code;
[P,Q]=size(chrom);  
P=P/2; 
binary=zeros(P,Q);  
for i=1:P
    for j=1:Q
        pick=rand;                  % rand number
        if pick>(chrom(2.*i-1,j)^2) % pick>¦Á.^2
            binary(i,j)=1;
        else
            binary(i,j)=0;
        end
    end
end