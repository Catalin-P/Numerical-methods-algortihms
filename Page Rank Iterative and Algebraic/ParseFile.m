function [val1 val2 M]=ParseFile(nume)
  % functie de parsare a datelor de intrare
  input=fopen(nume,"r");
  nrVarfuri=fscanf(input, "%d",1);
  M=zeros(nrVarfuri);
  L=zeros(nrVarfuri,1);
  for i=1:nrVarfuri
   linieCrt=fscanf(input, "%d", 1);
   % linkuri catre pag curenta
   L(i)=fscanf(input, "%d", 1);
   indexVecini=fscanf(input, "%d",L(i));
   % verificam daca exista linkuri catre aceeasi pagina
   for j=1:L(i)
     if(indexVecini(j)==linieCrt)
     L(i)-=1;
     break;
     endif
   endfor
   % impartim la L(i) pentru a calcula direct M
   if(L(i)!=0)
     M(linieCrt, indexVecini)=1/L(i);
   endif
   % nu luam in considerare nodurile cu linkuri catre ele insele
   M(linieCrt, linieCrt) = 0;
  endfor
  M=M';
  val=fscanf(input, "%f", 2);
  val1=val(1);
  val2=val(2);
  fclose(input);
  endfunction