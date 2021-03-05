function [values, colind, rowptr] = matrix_to_csr(A)
  crt_index=1;
  row_ptr_index=1;
  [m n] = size(A);
  for i=1:m
    first=1;
    for j=1:n
      if(A(i,j)!=0)
        values(crt_index)=A(i,j);
        colind(crt_index)=j;
        if(first==1)
          rowptr(row_ptr_index)=crt_index;
          row_ptr_index++;
          first=0;
        endif
        crt_index++;
      endif
    endfor
  endfor
  rowptr(row_ptr_index)=crt_index;
        
endfunction
