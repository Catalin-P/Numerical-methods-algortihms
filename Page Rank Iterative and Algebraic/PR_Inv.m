function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare 
  % calculam inversa rezolvand cele n sist de ecuatii SST
  [Q R]=Gram_Schmidt(A);
  n=size(A);
  I=ones(1,n);
  I=diag(I);
  for i=1:n
    B(:,i)=SST(R, Q'*I(:,i));
  endfor
  endfunction