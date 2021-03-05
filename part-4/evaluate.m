function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  cats_folder=[path_to_testset "cats/"];
  not_cats_folder=[path_to_testset "not_cats/"];
  cats=getImgNames(cats_folder);
  not_cats=getImgNames(not_cats_folder);
  [r1 c1]=size(cats);
  [r2 c2]=size(not_cats);
  X=preprocess(path_to_testset,histogram, count_bins);
  [rows cols]=size(X);
   for i=1:cols
    X(:,i)=(X(:,i)-mean(X(:,i)))/std(X(:,i));
  endfor
  X(:,cols+1)=1;
  y=X(:,1:3*count_bins+1)*w(:);
  count1=sum(y(1:r1)>=0);
  count2=sum(y(r1+1:r1+r2)<0);
  percentage=(count1+count2)/(r1+r2);
endfunction