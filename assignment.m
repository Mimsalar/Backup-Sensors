function [SENSORTYPE]=assignmenet(A,t,Type1,Type2)
%clear
%clc
%A=[1,0,0,0,-1,0,1,0,-1,0,0,0,0,0,0,0,0,0;0,1,1,0,1,-1,-1,1,0,0,-1,-1,0,0,0,0,0,0;0,0,0,1,0,1,0,-1,0,-1,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,1,0,1,0,-1,1,-1,0,0,0;0,0,0,0,0,0,0,0,0,1,0,1,1,-1,0,-1,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,-1,-1];
%w1=0.5;
%w2=0.5;
%t=[0 0 1 0 1 0 0 1 0 0 1 1 0 0 0 0 1 0];
%Type1=10;
%Type2=2;

[n,mm]=size(A); 
m=mm-rank(A);
Tobserved=(find(t==0));
ttype1=zeros(1,mm);


 ktype1=randsample([Tobserved],Type1);
 ttype1(1,ktype1)=1;
 
 ttype2=(1-t).*(1-ttype1);
 SENSORTYPE=zeros(1,m);
 SENSORTYPE(1,find(ttype1==1))=1;
 SENSORTYPE(1,find(ttype2==1))=2;

 
end