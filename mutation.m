function y=mutation(x,A,n,breakdown,selectedSensor)
[e,nvar]=size(x);
mm=rank(A);
s=0;
t([breakdown])=-1;
t([selectedSensor])=1;
D=find(t==0);
k=randsample(D,1);

while s<1
j1=randsample(D,1);
j2=randsample(D,1);
y1=x;

y1(j1)=x(j2);
y1(j2)=x(j1);

Tunobservede=A(:,find(y1==0));
if det(Tunobservede)~=0 
y=y1;
s=s+1;
end
end
end