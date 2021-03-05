function [w] = learn(X, y, lr, epochs)
  batch=64;
  [rows cols]=size(X);
  w_length=cols+1;
  w=zeros(w_length,1);
  w(1:(w_length-1))=-0.1+ 0.2 .*rand(w_length-1,1);
  for i=1:cols
    X(:,i)=(X(:,i)-mean(X(:,i)))/std(X(:,i));
  endfor
  X(:,cols+1)=1;
  for e=1:epochs
    rand_rows=randperm(rows);
    X_batch=X(rand_rows(1:batch),:);
    y_batch=y(rand_rows(1:batch));
    for i=1:(w_length-1)
      w(i)=w(i)-lr/rows*sum((X_batch(1:batch,:)*w-y_batch(1:batch)).*X_batch(1:batch,i));
    endfor
  endfor
endfunction