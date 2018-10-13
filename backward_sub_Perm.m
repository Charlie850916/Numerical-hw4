function x = backward_sub_Perm(U,b,Perm)
    [n,~] = size(U);
    x = zeros(n,1);
    for k = 1 : n-1
        b(Perm(k+1:n), 1) = b(Perm(k+1:n), 1) - U(Perm(k+1:n),k)*b(Perm(k), 1);
    end
    i = n;
    while i>0
        x(i,1) = (b(Perm(i),1) - dot(U(Perm(i),i+1:n),x(i+1:n,1)))/U(Perm(i),i);
        i = i-1;
    end
end