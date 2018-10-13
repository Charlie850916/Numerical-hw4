function Perm = Pivoting(A)
    [n,~] = size(A);
    Perm = zeros(1,n);
    S = zeros(1,n);
    for i = 1 : n
        Perm(i) = i;
        S(i) = max(abs(A(i,1:n)));
    end
    for k = 1 : n-1
        for j = k : n
            if( abs(A(Perm(j),k))/S(Perm(j)) >= abs(A(Perm(i),k))/S(Perm(i)) )
                break
            end
        end
        tmp = Perm(k);
        Perm(k) = Perm(j);
        Perm(j) = tmp;
        for i = k+1 : n
            z = A(Perm(i),k)/A(Perm(k),k);
            A(Perm(i),k) = z;
            A(Perm(i),k+1:n) = A(Perm(i),k+1:n) - z*A(Perm(k),k+1:n); 
        end
    end
end