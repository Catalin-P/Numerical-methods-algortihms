function [G_J, c_J] = Jacobi_factorization(A, b)
  n=size(A,1);
  D=zeros(n);
  for i=1:n
    D(i,i)=A(i,i);
  endfor
  G_J=D\(D-A);
  c_J=D\b;
endfunction
