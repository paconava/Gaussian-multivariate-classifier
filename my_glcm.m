function [r1, r2] = my_glcm( x, GL, d, theta )
% Initializing GLCM matrix
r1 = zeros(GL,GL);
r2 = x;
if theta == 0
    for row = 1:size(x,1)
        for col = 1:size(x,2)-d
            r1(x(row,col),x(row,col+d)) = r1(x(row,col),x(row,col+d)) + 1;
        end
    end
elseif theta == 45
    for row = d+1:size(x,1)
        for col = 1:size(x,2)-d
            r1(x(row,col),x(row-d,col+d)) = r1(x(row,col),x(row-d,col+d)) + 1;
        end
    end
elseif theta == 90
    for row = d+1:size(x,1)
        for col = 1:size(x,2)
            r1(x(row,col),x(row-d,col)) = r1(x(row,col),x(row-d,col)) + 1;
        end
    end
elseif theta == 135
    for row = d+1:size(x,1)
        for col = d+1:size(x,2)
            r1(x(row,col),x(row-d,col-d)) = r1(x(row,col),x(row-d,col-d)) + 1;
        end
    end
end
% Make symmetric
r1 = r1 + r1.';
% Return quantized image
r2 = double(r2);

end