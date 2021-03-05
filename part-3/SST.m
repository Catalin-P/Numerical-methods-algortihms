function [x] = SST(A, b)
  [n m] = size(A);
  p=min(n,m);
  x=zeros(p,1);
  for i=p:-1:1
    x(i)=(b(i)-A(i,i+1:p)*x(i+1:p))/A(i,i);
    endfor
endfunction
    