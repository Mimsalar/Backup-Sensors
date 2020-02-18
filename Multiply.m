function [z]=Multiply(InitialLocation,InitialType,breakdown,Prob1,Prob2)


[n,m]=size(InitialLocation);
    

    Prob(1,find(InitialType==1))=Prob1;
    Prob(1,find(InitialType==2))=Prob2;
    
    
    [nb,mb]=size( breakdown);
    Probb=repmat([1],1,m);
    for i=1:mb
    Probb(1,find(InitialLocation==breakdown(1,i)))=Prob(1,find(InitialLocation==breakdown(1,i)));
    end
z=prod(Probb);

end