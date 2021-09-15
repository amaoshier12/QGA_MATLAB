clc;
clear;
close all;
%% QGA-Take the solution of a complex binary function as an example 
    %% Sub-function description
    %-Popinitialize:   Population initialization; %-Popmeasure: Population measurement;
    %-Fitnessfunction: Setting by yourself;       %-QGU:      Quantum gate updating
    %% Setting parameters
    %-t:        Maximum genetic algebra;  %-sizepop: Population size;
    %-lenchrom: Binary length;            %-trace:   Evolutionary process;
    %-fitness:  Fitness value;            %-X:       Best individual;
    %-binary:   Binary code;              %-chrom:   Qubit encoding matrix
    t=100;             
    sizepop=40;                 
    lenchrom=[40 40];               
    trace=zeros(1,t); 
    best=struct('fitness',0,'X',[],'binary',[],'chrom',[]);  
    chrom=Popinitialize(sizepop*2,sum(lenchrom));        % Population initialization 
    binary=Popmeasure(chrom);                            % Population measurement 
    [fitness,X]=Fitnessfunction(binary,lenchrom);        % Using cost function to calculate fitness  
    [best.fitness,bestindex]=max(fitness);               % Finding the maximum 
    best.binary=binary(bestindex,:);
    best.chrom=chrom([2*bestindex-1:2*bestindex],:);
    best.X=X(bestindex,:);
    trace(1)=best.fitness;
    fprintf('%d\n',1)
    %% evolution 
    for gen=2:t
        fprintf('%d\n',gen) 
        binary=Popmeasure(chrom);
        [fitness,X]=Fitnessfunction(binary,lenchrom);
        chrom=QGU(chrom,fitness,best,binary);   % Quantum gate updating
        [newbestfitness,newbestindex]=max(fitness); 
        % Finding the best individual 
        if newbestfitness>best.fitness
            best.fitness=newbestfitness;
            best.binary=binary(newbestindex,:);
            best.chrom=chrom([2*newbestindex-1:2*newbestindex],:);
            best.X=X(newbestindex,:);
        end
        trace(gen)=best.fitness;
    end

%% Genetic algebra curve
plot(1:t,trace);
xlabel('Genetic algebra');
ylabel('Fitness value');

%% Optimal solution 
disp(['Best_X£º',num2str(best.X)])
disp(['Best_Y:',num2str(best.fitness)])

