function [ ctv, conf_m ] = my_error( tm, mi )
ctv = zeros(1, 4);
t_test = 0;
t = zeros(1, 4);
e = zeros(1, 4);
conf_m = zeros(4, 4);
for i = 1:numel(tm)
    if tm(i) ~= 0
        t_test = t_test + 1;
        if tm(i) == 1
            t(1) = t(1) + 1;
            if mi(i) ~= 1
                e(1) = e(1) + 1;
                conf_m(1,mi(i)) = conf_m(1,mi(i)) + 1;
            elseif mi(i) == 1
                conf_m(1,1) = conf_m(1,1) + 1;
            end
        elseif tm(i) == 2
            t(2) = t(2) + 1;
            if mi(i) ~= 2
                e(2) = e(2) + 1;
                conf_m(2,mi(i)) = conf_m(2,mi(i)) + 1;
            elseif mi(i) == 2
                conf_m(2,2) = conf_m(2,2) + 1;
            end
        elseif tm(i) == 3
            t(3) = t(3) + 1;
            if mi(i) ~= 3
                e(3) = e(3) + 1;
                conf_m(3,mi(i)) = conf_m(3,mi(i)) + 1;
            elseif mi(i) == 3
                conf_m(3,3) = conf_m(3,3) + 1;
            end
        elseif tm(i) == 4
            t(4) = t(4) + 1;
            if mi(i) ~= 4
                e(4) = e(4) + 1;
                conf_m(4,mi(i)) = conf_m(4,mi(i)) + 1;
            elseif mi(i) == 4
                conf_m(4,4) = conf_m(4,4) + 1;
            end
        else
            tm(i)
        end
    end
end
for i = 1:4
    ctv(i) = (1-(double(e(i))/double(t(i))))*100;
end
end

