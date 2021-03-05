function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  numeOut=[ nume ".out"];
  % folosim algoritmii iterative si algebraic
  outFile=fopen(numeOut,"a");
  R1=Iterative(nume,d,eps);
  R2=Algebraic(nume,d);
  N=size(R1);
  [val1 val2]=ParseFile(nume);
  % sortam R2
  PR=sort(R2, "descend");
  fprintf(outFile, "%d\n\n", N(1));
  fprintf(outFile, "%.6f\n", R1);
  fprintf(outFile, "\n");
  fprintf(outFile, "%.6f\n", R2);
  fprintf(outFile, "\n");
  % scriem in fisier pagina curenta si nr vecinilor 
  for i=1:N(1)
    fprintf(outFile, "%d ", i);
    for j=1:N(1)
      if( R2(j)==PR(i))
        fprintf(outFile, "%d ", j);
        break;
      endif
    endfor
    % scriem in fisier u(PR(i))
    fprintf(outFile, "%.6f\n", Apartenenta(PR(i), val1, val2));
    endfor
  fclose(outFile);
  endfunction