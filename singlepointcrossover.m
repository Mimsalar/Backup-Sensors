function  [off1  off2]=singlepointcrossover(A,n,m,Popinitial,popsize)
%A=[1,0,0,0,-1,0,1,0,-1,0,0,0,0,0,0,0,0,0;0,1,1,0,1,-1,-1,1,0,0,-1,-1,0,0,0,0,0,0;0,0,0,1,0,1,0,-1,0,-1,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,1,0,1,0,-1,1,-1,0,0,0;0,0,0,0,0,0,0,0,0,1,0,1,1,-1,0,-1,0,0;0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,-1,-1];

nvar=m;
c=randi([1 nvar-1]);

l=0;
ll=0;
while l<1
%select first parent
 i1=randi([1 popsize]);
 p1=Popinitial(i1);
  
 %select second parent
 i2=randi([1 popsize]);
 p2=Popinitial(i2);
  
  if sum(p1.position(1:c)==0)==sum(p2.position(1:c)==0) && sum(p1.position(1:c)==1)==sum(p2.position(1:c)==1)
      
  
      

     yy1=[p1.position(1:c)  p2.position(c+1:end)];

      yy2=[p2.position(1:c)  p1.position(c+1:end)];
      
   Tunobserved1=A(:,find(yy1==0));
   Tunobserved2=A(:,find(yy2==0));
      if det(Tunobserved1)~=0 && det(Tunobserved2)~=0 
      
    off1=yy1;
    off2=yy2;
  
    
l=l+1;

     end


  end
end



end     
   
