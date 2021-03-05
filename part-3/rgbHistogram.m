function [sol] = rgbHistogram(path_to_image, count_bins)
  sol= zeros(1, 3*count_bins);
  img=imread(path_to_image);
  red=Histogram(img(:,:,1),count_bins,256);
  green=Histogram(img(:,:,2),count_bins,256);
  blue=Histogram(img(:,:,3),count_bins,256);
  sol(1:count_bins)=red(:);
  sol(count_bins+1:2*count_bins)=green(:);
  sol(count_bins*2+1:3*count_bins)=blue(:);
end