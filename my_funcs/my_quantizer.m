function [ r1 ] = my_quantizer( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Quantizing the image to 8 Gray Levels
for i = 1:numel(x)
    if (x(i)>=0 && x(i)<=15)
        x(i) = 1;
    elseif (x(i) >=16 && x(i)<=31)
        x(i) = 2;
    elseif (x(i)>=32 && x(i)<=47)
        x(i) = 3;
    elseif (x(i)>=48 && x(i)<=63)
        x(i) = 4;
    elseif (x(i)>=64 && x(i)<=79)
        x(i) = 5;
    elseif (x(i)>=80 && x(i)<=95)
        x(i) = 6;
    elseif (x(i)>=96 && x(i)<=111)
        x(i) = 7;
    elseif (x(i)>=112 && x(i)<=127)
        x(i) = 8;
    elseif (x(i)>=128 && x(i)<=143)
        x(i) = 9;
    elseif (x(i)>=144 && x(i)<=159)
        x(i) = 10;
    elseif (x(i)>=160 && x(i)<=175)
        x(i) = 11;
    elseif (x(i)>=176 && x(i)<=191)
        x(i) = 12;
    elseif (x(i)>=192 && x(i)<=207)
        x(i) = 13;
    elseif (x(i)>=208 && x(i)<=223)
        x(i) = 14;
    elseif (x(i)>=224 && x(i)<=239)
        x(i) = 15;
    elseif (x(i)>=240 && x(i)<=255)
        x(i) = 16;
    end
end
r1 = x;
end

