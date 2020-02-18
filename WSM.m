function [Z]=WSM(A,ttype)

%clc
%clear
%A=[1,0,0,0,-1,0,1,0,-1,0,0,0,0,0,0,0,0,0;0,1,1,0,1,-1,-1,1,0,0,-1,-1,0,0,0,0,0,0;0,0,0,1,0,1,0,-1,0,-1,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,1,0,1,0,-1,1,-1,0,0,0;0,0,0,0,0,0,0,0,0,1,0,1,1,-1,0,-1,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,-1,-1];
%w1=0.5;
%w2=0.5;
%t=[0 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0 0];
%ttype=[2 0 1 2 1 0 0 1 1 1 0 1 1 1 0 0 1 1];

prob1=0.5;
prob2=0.3;


Tunobserved=A(:,find(ttype==0));

Tobserved=A(:,find(ttype~=0));
ttype(ttype==0)=[];

[n,mm]=size(A); 
m=mm-rank(A);

%%To calculate z1
 obsz1=zeros(m,1);
 obsz1(find(ttype==1),1)=1-prob1;
 obsz1(find(ttype==2),1)=1-prob2;
 Tobsz1=obsz1';
 
 obszz1=repmat(Tobsz1,rank(A),1);
Sz1=abs(inv(Tunobserved)*(Tobserved)).*obszz1;
Sz1(find(Sz1==0))=1;
SSz1=prod(Sz1,2);
SSSz1=1-SSz1;
Z1=sum(SSSz1);
%Z1=max(SSSz1);

%% To calculate z2
 obsz2=zeros(m,1);
 obsz2(find(ttype==1),1)=prob1;
 obsz2(find(ttype==2),1)=prob2;
Sz2=abs(inv(Tunobserved)*(Tobserved));
oobsz2=obsz2';
SSz2=sum(Sz2,1);
SSSz2=SSz2.*(oobsz2);
%Z2=SSz2*(obsz2);
Z2=max(SSSz2);
Z=[Z1];
end
