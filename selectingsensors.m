function [selectedSensorR]=selectingsensors(A,m,InitialLocation,maxsensor)


t=zeros(1,m);
 J=zeros(1,m);
selectedSensor=combntns(InitialLocation,maxsensor);
   
[InRow,InColumn]=size(selectedSensor);
R=zeros(InRow,1);

for secondloop=1:InRow

 breakdown=selectedSensor(secondloop,:);
 [row,col]=size(breakdown);
 
 t=zeros(1,m);
 
 J=zeros(1,m);
 
 t([breakdown])=-1;

t([InitialLocation])=1;

D=find(t==0);

k=combntns(D,col);
[rowk,colk]=size(k);
for g=1:rowk
J=zeros(1,m);
J(k(g,1:colk))=1;
J(InitialLocation)=1;
J(breakdown)=0;
Tunobserved=A(:,find(J==0)); 
if det(Tunobserved)~=0
 R(secondloop)=1;
  


end
end
end
missed=InRow-sum(R);
Rprime=1-R;


 selectedSensorR=selectedSensor;   
 selectedSensorR(find(Rprime==1),:)=[];  
 end
    
    
    
    
    

