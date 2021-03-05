function [A, b] = generate_probabilities_system(rows)
  n = (rows + 1) * rows / 2;
  b = zeros(n, 1);
  A = zeros(n);
  % caz p1, general valabil pt ca rows > 2
  A(1, 1) = 4; A(1, 2) = -1; A(1, 3) = -1;
  for i = 2:rows
    for j = 1:i
      line=triangle_to_square(i,j);
      if(i<rows)
        if(j==1)
          A(line, triangle_to_square(i, j))=5;
          A(line, triangle_to_square(i-1,j))=-1;
          A(line, triangle_to_square(i+1,j))=-1;
          A(line, triangle_to_square(i+1,j+1))=-1;
          A(line, triangle_to_square(i,j+1))=-1;
        endif
        if(j==i)
          A(line, triangle_to_square(i, j))=5;
          A(line, triangle_to_square(i-1,j-1))=-1;
          A(line, triangle_to_square(i+1,j))=-1;
          A(line, triangle_to_square(i+1,j+1))=-1;
          A(line, triangle_to_square(i,j-1))=-1;
        endif
        if(j!=1 && j!=i)
          A(line, triangle_to_square(i, j))=6;
          A(line, triangle_to_square(i,j-1))=-1;
          A(line, triangle_to_square(i,j+1))=-1;
          A(line, triangle_to_square(i-1,j))=-1;
          A(line, triangle_to_square(i-1,j-1))=-1;
           A(line, triangle_to_square(i+1,j))=-1;
          A(line, triangle_to_square(i+1,j+1))=-1;
        endif    
      endif
      if(i==rows)
        if(j==1)
          A(line, triangle_to_square(i, j))=4;
          A(line, triangle_to_square(i-1,j))=-1;
          A(line, triangle_to_square(i,j+1))=-1;
        endif
        if(j==i)
          A(line, triangle_to_square(i, j))=4;
          A(line, triangle_to_square(i-1,j-1))=-1;
          A(line, triangle_to_square(i,j-1))=-1;
        endif
         if(j!=1 && j!=i)
          A(line, triangle_to_square(i, j))=5;
          A(line, triangle_to_square(i,j-1))=-1;
          A(line, triangle_to_square(i,j+1))=-1;
          A(line, triangle_to_square(i-1,j))=-1;
          A(line, triangle_to_square(i-1,j-1))=-1;
        endif
      endif
    endfor
  endfor
  for i = n-rows+1:n
    b(i) = 1;
  endfor
  
endfunction