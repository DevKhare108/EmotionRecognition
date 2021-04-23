function [GMM]=makeGMM(X,L,k)
    l=length(L); w=[]; Co={};mu={}; GMM={};
    for i=1:k
        w(i)=sum(L==i)/l;
        mu{i}=mean(X(:,find(L==i)),2);
        Co{i}=cov(X(:,find(L==i))');
    end
    GMM{1}=w;GMM{2}=mu;GMM{3}=Co;
    