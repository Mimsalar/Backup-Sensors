function   pop=populationmaker(m,n,A,InitialLocation,InitialType,breakdown)

s=0;
[row,col]=size(breakdown);
%t=zeros(1,m);
  while s<1 
 mm=rank(A);
 t=zeros(1,m);
 J=zeros(1,m);
 SenNew=zeros(1,m);

t([breakdown])=-1;
t([InitialLocation])=1;
D=find(t==0);
k=randsample(D,col);
[rowk,colk]=size(k);
J(k)=1;
SenNew(k)=1;
J([InitialLocation])=1;
J([breakdown])=0;
Tunobserved=A(:,find(J==0));  
%Tobserved=A(:,find(t==0));
if   det(Tunobserved)~=0     %n=number of row vector of matrix A
    
    

Tobserved=(find(J==1));


ttype12=zeros(1,m);
ttype12(InitialLocation)=InitialType;
ttype12([breakdown])=0;
ttype12(k)=1;

 
    pop=ttype12;
    s=s+1;
else 
Tunobserved=zeros(n,n);
end 

  end

end

