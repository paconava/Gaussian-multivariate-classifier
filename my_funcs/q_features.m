function [ q1, q3 ] = q_features( GLCM )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
m = GLCM / sum(GLCM(:));

q1 = sum(sum(m(1:8,1:8)));
% q2 = sum(sum(m(1:8,9:16)));
q3 = sum(sum(m(9:16,9:16)));

end

