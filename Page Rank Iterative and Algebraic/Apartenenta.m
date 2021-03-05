function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  % impunem conditiile de continuitate a functiei ax+b
  a=1/(val2-val1);
  b=val1/(val1-val2);
  % calculam valoarea functie in x
  y=a*x+b;
  endfunction
	