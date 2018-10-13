function [U,x] = GuassEliminationPerm(A,b,Perm)
 M = [A b];
 [n,m] = size(M);
 for k = 1 : n-1
     for i = k+1 : n
         z = M(Perm(i),k)/M(Perm(k),k);
         M(Perm(i),k) = 0;
         M(Perm(i),k+1:m) = M(Perm(i),k+1:m)-z*M(Perm(k),k+1:m);
     end
 end
 U = M(1:n,1:n);
 x = M(1:n,m);
end