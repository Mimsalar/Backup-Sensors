function   pop=populationmakernew(m,n)
%clc
%clear
tic
%A=Matrix of new links
A=[
1	0	0	0	1	0	1	0	1	0	0	0	0	0	0	0	0	0
0	1	1	0	0	1	0	1	0	0	1	1	0	0	0	0	0	0
0	0	0	1	0	0	0	0	0	1	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	1	0	0	0	1	1	1	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1];
B=[
1	0	0	0	-1	0	1	0	-1	0	0	0	0	0	0	0	0	0
0	1	1	0	1	-1	-1	1	0	0	-1	-1	0	0	0	0	0	0
0	0	0	1	0	1	0	-1	0	-1	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	1	0	1	0	-1	1	-1	0	0	0
0	0	0	0	0	0	0	0	0	1	0	1	1	-1	0	-1	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	-1	-1];
    
    
T=zeros(m,m);
pop=zeros(1,m);
pops=zeros(1,m);
ss=0;
t=zeros(1,n);
LL=rank(B);
empty_individual.position=[];
H=repmat(empty_individual,n,1);

F=repmat(empty_individual,LL,1);
LL=rank(B);
for ia=1:LL
    
H(ia).position=(find(A(ia,:)));


  %%

end
I=0;
while I<1
for ib=1:LL
    
   F(ib).position=randsample(H(ib).position,1);
    
    
end
pops(1,[F.position])=1;
Tuobserved=B(1:23,[F.position]);

if det(Tuobserved)~=0
    pop=pops;
I=I+1;
end
end
toc
end