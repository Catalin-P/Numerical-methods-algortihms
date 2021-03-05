function [centroids] = clustering_pc(points, NC)
  [N D]=size(points);
  init_centroids=zeros(NC,D);
  centroids=init_centroids;
  empty_matrix=centroids;
  points_in_mean=zeros(NC, 1);
  empty_array=points_in_mean;
  for i=1:N
    index=mod(i,NC);
    if index== 0
      init_centroids(NC, 1:D)+=points(i, 1:D);
      points_in_mean(NC)++;
    else
      init_centroids(index, 1:D)+=points(i, 1:D);
      points_in_mean(index)++;
    endif
  endfor
  for i=1:NC
    init_centroids(i, 1:D)/=points_in_mean(i);
  endfor
  check_while=1;
  while check_while
    is_equal_vector=1;
    centroids=empty_matrix;
    points_in_mean=empty_array;
    for i=1:N
      index=closestCentroid(init_centroids, points(i, 1:D), NC, D);
      centroids(index, 1:D)+=points(i, 1:D);
      points_in_mean(index)++;
    endfor
    for i=1:NC
      centroids(i, 1:D)/=points_in_mean(i);
    endfor
    for i=1:NC
      for j=1:D
        if centroids(i,j)!=init_centroids(i,j)
          is_equal_vector=0;
        endif
      endfor
    endfor
    if is_equal_vector==1
      check_while=0;
    endif
     for i=1:NC
      init_centroids(i, 1:D)=centroids(i, 1:D);
    endfor
  endwhile
endfunction
