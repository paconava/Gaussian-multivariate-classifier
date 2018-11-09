function [ q1, q4 ] = q_features( GLCM )
m = GLCM / sum(GLCM(:));

q1 = sum(sum(m(1:8,1:8)));
% q2 = sum(sum(m(1:8,9:16)));
% q3 = sum(sum(m(9:16,1:8));
q4 = sum(sum(m(9:16,9:16)));
end

