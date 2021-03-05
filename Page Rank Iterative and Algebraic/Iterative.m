function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  
  % calculam M
  [val1 val2 M]=ParseFile(nume);
  [n m]=size(M);
  % initializam R
  R=ones(n,1);
  col=R;
  R=R/n;
  % iteram pana cand erorea devine suficient de mica
  while(1)
    % pastram iteratia precedenta
    Past_R=R;
    R=d*M*R+(1-d)/n*col;
    % condtie de oprire
    if norm(R-Past_R)<eps
      break;
    endif
  endwhile
  % R devine vechea iteratie dupa oprire
  R=Past_R;
 endfunction