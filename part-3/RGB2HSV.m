function [img]=RGB2HSV(img, count_bins)
  img=double (img)/255.0;
  red=img(:,:,1);
  green=img(:,:,2);
  blue=img(:,:,3);
  cmax=max(max(img(:,:,1),img(:,:,2)),img(:,:,3));
  cmin=min(min(img(:,:,1),img(:,:,2)),img(:,:,3));
  delta(:,:)=cmax(:,:)-cmin(:,:);
  hue=red;
  cond1=delta==0;
  cond2=(delta~=0) & (cmax==red);
  cond3=(delta~=0) & (cmax==green);
  cond4=(delta~=0) & (cmax==blue);
  cond5=delta~=0;
  hue(cond1)=0;
  hue(cond2)=60*mod((green(cond2)-blue(cond2))./delta(cond2),6);
  hue(cond3)=60*((blue(cond3)-red(cond3))./delta(cond3).+2);
  hue(cond4)=60*((red(cond4)-green(cond4))./delta(cond4).+4);
  hue=hue/360.0;
  green(cmax==0)=0;
  green(cmax~=0)=delta(cmax~=0)./cmax(cmax~=0);
  img(:,:,1)=hue(:,:);
  img(:,:,2)=green(:,:);
  img(:,:,3)=cmax(:,:);
  endfunction