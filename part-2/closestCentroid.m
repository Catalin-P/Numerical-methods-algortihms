function [index min_dist] = closestCentroid(centroid, point, NC,D)
  min_dist=norm(centroid(1,1:D)- point,2);
  index=1;
  for i=2:NC
    crt_dist = norm(centroid(i,1:D)- point,2);
    if min_dist > crt_dist
      min_dist=crt_dist;
      index=i;
    endif
  endfor
endfunction

      