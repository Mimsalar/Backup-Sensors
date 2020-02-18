%%main body geberator:
clc
clear 
close all
%%WSM weights
%w1=input('First weight on average of observed on each equation  ');
%w2=input('Second weight on the frequency of observed links in different equations   ');
%%information related to the number of sensors required for the full link
%%flow observability

A=xlsread('Fishbone','sheet2');
[n,m]=size(A);
Totalsensorrequired=m-rank(A);




%% GA parameter
Maxiter=100;     %maximum number of iteration
popsize=input('please insert the population size (10*n)   ');

pc=0.5 ;    %percentage crossover

nc= 2*round(pc*popsize/2);   %crossover population size (num of offspring)

pm=0.6 ;     %percentage mutation

nm= round(pm*popsize);     %mutation population size

%% backup sensors idea

%maximum numbre of sensors that can breakdown

maxsensor=input('please determine the number of sensors failure ');
%% initial location of sensors determined according to the Min-sum

InitialLocation=[1 3 4 5 6 9 10 13 14 15 16 17];
    InitialType=[2 1 2 2 2 2  2  1  1  2  2  1];
    %probability of first and second types of sensors
    Prob1=0.5;
    Prob2=0.3;
   
selectedSensor=selectingsensors(A,m,InitialLocation,maxsensor);
[InRow,InColumn]=size(selectedSensor);
%%
empty_individual.position=[];
empty_individual.cost=[];
empty_indivisual.prob=[];
empty_indivisual.diff=[];
empty_indivisual.multiply=[];


for secondloop=1:InRow

 A=xlsread('Fishbone','sheet2');
[n,m]=size(A);

breakdown=selectedSensor(secondloop,:);

%% initialization 





Popinitial=repmat(empty_individual,popsize,1);
for i=1:popsize
 Popinitial(i).position=populationmaker(m,n,A,InitialLocation,InitialType,breakdown); 
 
 %evaluation
Popinitial(i).cost=WSM(A,Popinitial(i).position);
Popinitial(i).prob=Prob(m,InitialLocation,breakdown);
end
% sort population
Costs=[Popinitial.cost];
[Costs,sortorder]=sort(Costs);
Popinitial=Popinitial(sortorder);

%best solution in each iteration


%defined an array to hold best cost values


%%  Main body:

for j=1:Maxiter
    
 %crossover
 popc=repmat(empty_individual,nc/2,2);
 for k=1:nc/2

    
  %apply crossover
  [popc(k,1).position popc(k,2).position]=singlepointcrossover(A,n,m,Popinitial,popsize);
  
  
  % evaluate crossover

  
  popc(k,1).cost=WSM(A,popc(k,1).position);
  popc(k,2).cost=WSM(A,popc(k,2).position);
  
  
  popc(k,1).prob=Prob(m,InitialLocation,breakdown);
  popc(k,2).prob=Prob(m,InitialLocation,breakdown);
  
  popcc=popc(:); 
 end
  
 %mutation
 popm=repmat(empty_individual,nm,1);
 for u=1:nm
 ii=randi([1 popsize]);
 ps=Popinitial(ii);
 popm(u).position=mutation(ps.position,A,n,breakdown,selectedSensor);  
     %evaluation in mutants
 
 popm(u).cost=WSM(A,popm(u).position);
 popm(u).prob=Prob(m,InitialLocation,breakdown);
 end
 
 
 %^create merged population
 Popinitial=[Popinitial
              popcc
              popm];
 %sort merged population
Costss=[Popinitial.cost];
[Costss,sortorder]=sort(Costss);
Popinitial=Popinitial(sortorder);
 
 %truncation
 Popinitial=Popinitial(1:popsize);
 
 %best solution in each iteration
Bestsolution=Popinitial(1);

%store best cost
Bestcost(j)=Bestsolution.cost;


%show iteration information
disp(['Iteration' num2str(j) ': best cost=' num2str(Bestcost(j))]);
end

%% results
Located=zeros(1,m);
Located(InitialLocation)=1;
Solution(secondloop).position=Bestsolution.position;
Located=(Solution(secondloop).position).*Located;
QQ=find(Located~=Solution(secondloop).position);
Solution(secondloop).diff=QQ;
Solution(secondloop).cost=Bestsolution.cost;
Solution(secondloop).prob=Bestsolution.prob;
Solution(secondloop).multiply=Multiply(InitialLocation,InitialType,breakdown,Prob1,Prob2);
end




%figure;
%plot(Bestcost,'linewidth', 2);
%xlabel('iteration');
%ylabel('Cost');