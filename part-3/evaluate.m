function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  cats_folder=[path_to_testset "cats/"];
  not_cats_folder=[path_to_testset "not_cats/"];
  cats=getImgNames(cats_folder);
  not_cats=getImgNames(not_cats_folder);
  [r1 c1]=size(cats);
  [r2 c2]=size(not_cats);
  predicted=0;
  feature=zeros(1,3*count_bins+1);
  if strcmp(histogram, "RGB")==1
    for i=1:r1
      crt_image=[cats_folder cats(i,:)];
      feature=rgbHistogram(crt_image, count_bins);
      feature(3*count_bins+1)=1;
      if feature*w >=0
        predicted++;
      endif
    endfor
    for i=1:r2
      crt_image=[not_cats_folder not_cats(i,:)];
      feature=rgbHistogram(crt_image, count_bins);
      feature(3*count_bins+1)=1;
      if feature*w<0
        predicted++;
      endif
    endfor
  else
    for i=1:r1
      crt_image=[cats_folder cats(i,:)];
      feature=hsvHistogram(crt_image, count_bins);
      feature(3*count_bins+1)=1;
      if feature*w >= 0
        predicted++;
      endif
    endfor
    for i=1:r2
      crt_image=[not_cats_folder not_cats(i,:)];
      feature=hsvHistogram(crt_image, count_bins);
      feature(3*count_bins+1)=1;
      if feature*w<0
        predicted++;
      endif
    endfor
  endif
  percentage=predicted/(r1+r2);
endfunction