function Perm = Pivoting(A)
    [n,~] = size(A);
    Perm(1,1:n) = 1:n;
    S = max(abs(A'));
    for k = 1 : n-1
        for j = k : n
            for i = k : n
                if( abs(A(Perm(j),k))/S(Perm(j)) < abs(A(Perm(i),k))/S(Perm(i)) )
                    break
                end
                if i == n
                    pivot = j;
                end
            end
        end
        tmp = Perm(k);
        Perm(k) = Perm(pivot);
        Perm(pivot) = tmp;
        for i = k+1 : n
            z = A(Perm(i),k)/A(Perm(k),k);
            A(Perm(i),k) = z;
            A(Perm(i),k+1:n) = A(Perm(i),k+1:n) - z*A(Perm(k),k+1:n); 
        end
    end
end