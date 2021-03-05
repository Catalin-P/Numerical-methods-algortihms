function [cost] = compute_cost_pc(points, centroids)
  [N D] = size(points);
  NC = size(centroids,1);
  cost=0;
  for i=1:N
    [index min_dist]=closestCentroid(centroids, points(i,1:D), NC,D);
    cost+=min_dist;
  endfor
endfunction

