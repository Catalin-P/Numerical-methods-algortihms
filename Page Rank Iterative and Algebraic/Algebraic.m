function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  % calculam M
	[val1 val2 M]=ParseFile(nume);
  [n m]=size(M);
  % initializare R
  R=ones(n,1);
  col=R;
  R=R/n;
  % constructie matrice I
  I=ones(1,n);
  I=diag(I);
  % determinare inversa din formula
  T=I-d*M;
  Inv_T=PR_Inv(T);
  % determinarea lui R pe baza formulei
  R=Inv_T*(1-d)/n*col;
  endfunction