function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  cats_folder=[path_to_dataset "cats/"];
  not_cats_folder=[path_to_dataset "not_cats/"];
  cats=getImgNames(cats_folder);
  not_cats=getImgNames(not_cats_folder);
  [r1 c1]=size(cats);
  [r2 c2]=size(not_cats);
  X_rows=r1+r2;
  y=zeros(X_rows,1);
  y(1:r1)=1;
  y(r1+1:r1+r2)=-1;
  X=zeros(X_rows,3*count_bins);
  if strcmp(histogram, "RGB")==1
    for i=1:r1
      crt_image=[cats_folder cats(i,:)];
      X(i,1:3*count_bins)=rgbHistogram(crt_image, count_bins);
    endfor
    for i=1:r2
      crt_image=[not_cats_folder not_cats(i,:)];
      X(i+r1,1:3*count_bins)=rgbHistogram(crt_image, count_bins);
    endfor
  else
    for i=1:r1
      crt_image=[cats_folder cats(i,:)];
      X(i,1:3*count_bins)=hsvHistogram(crt_image, count_bins);
    endfor
    for i=1:r2
      crt_image=[not_cats_folder not_cats(i,:)];
      X(i+r1,1:3*count_bins)=hsvHistogram(crt_image, count_bins);
    endfor
  endif
endfunction
