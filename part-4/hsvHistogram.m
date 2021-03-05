function [sol] = hsvHistogram(path_to_image, count_bins)
  sol=zeros(1,3*count_bins);
  img=imread(path_to_image);
  img=RGB2HSV(img, count_bins);
  hue=Histogram(img(:,:,1),count_bins,1.01);
  saturation=Histogram(img(:,:,2),count_bins,1.01);
  value=Histogram(img(:,:,3),count_bins,1.01);
  sol(1:count_bins)=hue(:);
  sol(count_bins+1:2*count_bins)=saturation(:);
  sol(count_bins*2+1:3*count_bins)=value(:);
endfunction