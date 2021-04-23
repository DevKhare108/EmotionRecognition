function [PC] = PCA(X,dim)
    mu = mean(X,1) ;
    means= ones(size(X,1),1)*mu;
    X=X-means;
    [U,eig,V]=svd(X,'econ');
    PC=X*V(:,[1:dim]);
end