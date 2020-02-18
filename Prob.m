function [Z]=Prob(m,InitialLocation,breakdown)

%InitialLocation=[1 3 4 5 6 9 10 13 14 15 16 17];
%InitialType=[2 1 2 1 1 1 2  1  1   1  1  1];
%breakdown=selectedSensor(1,:);
t=zeros(1,m);
tt=zeros(1,m);
t(InitialLocation)=1;
tt(breakdown)=1;
Z=find(tt==1);
end