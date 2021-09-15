function chrom=QGU(chrom,fitness,best,binary)
%% Input  
%-chrom£ºQubit encoding before update;
%-fitness£ºFitness value;
%-best£ºBest individual;
% binary£ºBinary code;
%% Output
%-chrom£ºQubit encoding after update;
sizepop=size(chrom,1)/2;
lenchrom=size(binary,2);
for i=1:sizepop
    for j=1:lenchrom
        A=chrom(2*i-1,j);   % ¦Á
        B=chrom(2*i,j);     % ¦Â
        x=binary(i,j);
        b=best.binary(j);
        if ((x==0)&(b==0))||((x==1)&(b==1))
            delta=0;                  % delta: the size of rotation angle; 
            s=0;                      % s:     the sign of rotation angle;
        elseif (x==0)&(b==1)&(fitness(i)<best.fitness)
            delta=0.01*pi;
            if A*B>0
                s=1;
            elseif A*B<0
                s=-1;
            elseif A==0
                s=0;
            elseif B==0
                s=sign(randn);
            end
        elseif (x==0)&(b==1)&(fitness(i)>=best.fitness)
            delta=0.01*pi;
            if A*B>0
                s=-1;
            elseif A*B<0
                s=1;
            elseif A==0
                s=sign(randn);
            elseif B==0
                s=0;
            end
        elseif (x==1)&(b==0)&(fitness(i)<best.fitness)
            delta=0.01*pi;
            if A*B>0
                s=-1;
            elseif A*B<0
                s=1;
            elseif A==0
                s=sign(randn);
            elseif B==0
                s=0;
            end
        elseif (x==1)&(b==0)&(fitness(i)>=best.fitness)
            delta=0.01*pi;
            if A*B>0
                s=1;
            elseif A*B<0
                s=-1;
            elseif A==0
                s=0;
            elseif B==0
                s=sign(randn);
            end
        end
        e=s*delta;                         % e: rotation angle; 
        U=[cos(e) -sin(e);sin(e) cos(e)];  % U: quantum revolving door; 
        y=U*[A B]';       
        chrom(2*i-1,j)=y(1); % Updated ¦Á;
        chrom(2*i,j)=y(2);   % Updated ¦Â; 
    end
end
