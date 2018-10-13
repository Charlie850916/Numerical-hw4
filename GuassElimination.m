function [U,x] = GuassElimination(A,b)
 M = [A b];
 [n,m] = size(M);
 for k = 1 : n-1
     for i = k+1 : n
         z = M(i,k)/M(k,k);
         M(i,k) = 0;
         M(i,k+1:m) = M(i,k+1:m)-z*M(k,k+1:m);
     end
 end
 U = M(1:n,1:n);
 x = M(1:n,m);
end