function chrom=Popinitialize(P,Q)
%% Population initialization 
% P: Population size*2;
% Q: Qubit encoding length 
for i=1:P
    for j=1:Q
        chrom(i,j)=1/sqrt(2);
    end
end