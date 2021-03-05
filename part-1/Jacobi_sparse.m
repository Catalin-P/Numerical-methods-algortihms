function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  n=size(c);
  x=zeros(n,1);
  x_old=x;
  check_while=1;
  while check_while
    x=csr_multiplication(G_values, G_colind, G_rowptr, x_old)+c;
    if norm(x-x_old)<tol
      check_while=0;
      break;
    endif
    x_old=x;
  endwhile
  
endfunction