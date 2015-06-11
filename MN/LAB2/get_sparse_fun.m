function f = get_sparse_fun( n,s )

    tmp=randperm(n);
    f=zeros(n,1);
    f(tmp(1:s))=randn(s,1);

end

