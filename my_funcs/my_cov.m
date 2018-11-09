function [ r ] = my_cov( ti, tm, n_occ, n_feats, class  )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
auxVec = zeros(n_occ,n_feats);
for i = 1:n_feats
    auxMat = ti(:,:,i);
    auxVec2 = auxMat(tm==class);
    for j = 1:n_occ
        auxVec(j,i) = auxVec2(j);
    end
end

r = cov(auxVec);

end

