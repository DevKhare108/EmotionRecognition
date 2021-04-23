function [result]=classifyGMM(GMM,X);
    k=length(GMM{1});
    p={};sums=zeros(size(X,2),1);
    for i=1:k
        p{i}=GMM{1}(i)*mvnpdf(X',GMM{2}{i}',GMM{3}{i});
        sums=sums+p{i};
    end
    for i=1:size(X,2)
        for j=1:k
            phi(i,j)=p{j}(i)/sums(i);
        end
        result(i)=find(phi(i,:)==max(phi(i,:)));
    end
 
    
        
    