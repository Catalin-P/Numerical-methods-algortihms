function [color_hist]=Histogram(color_matrix, count_bins, dim)
  color_hist=zeros(1,count_bins);
  for i=1:count_bins
    left=dim/count_bins*(i-1);
    right=dim/count_bins*i;
    index=color_matrix>=left &color_matrix<right;
    if dim ==256
      color_hist(i)=sum(accumarray(color_matrix(index)+1,1));
    else
      color_hist(i)=sum(accumarray(uint16((color_matrix(index)+1)*10000),1));
    endif
  endfor
endfunction
