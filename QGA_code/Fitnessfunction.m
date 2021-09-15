function [fitness,X]=Fitnessfunction(binary,lenchrom)
%% Fitness
%% Input
%-binary:   Binary code;
%-lenchrom: Binary length;
%% output
%-fitness:  Fitnesss value 
%-X:        Decimal variable  
sizepop=size(binary,1);
fitness=zeros(1,sizepop);
num=size(lenchrom,2);
X=zeros(sizepop,num);
for i=1:sizepop
    [fitness(i),X(i,:)]=Objectfunction(binary(i,:),lenchrom);
end
