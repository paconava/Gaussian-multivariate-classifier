function [ img ] = plot_mapped( mapped )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[n,m] = size(mapped);
img = zeros(n,m,3);
for i = 1:size(mapped, 1)
    for j = 1:size(mapped, 2)
        if mapped(i,j) == 1
            img(i,j,1) = 62/255;
            img(i,j,2) = 38/255;
            img(i,j,3) = 168/255;
        elseif mapped(i,j) == 2
            img(i,j,1) = 39/255;
            img(i,j,2) = 151/255;
            img(i,j,3) = 235/255;
        elseif mapped(i,j) == 3
            img(i,j,1) = 129/255;
            img(i,j,2) = 204/255;
            img(i,j,3) = 89/255;
        elseif mapped(i,j) == 4
            img(i,j,1) = 249/255;
            img(i,j,2) = 251/255;
            img(i,j,3) = 21/255;
        end
    end
end
map = [62/255, 38/255, 168/255
  39/255, 151/255, 235/255
  129/255, 204/255, 89/255
  249/255, 251/255, 21/255];
figure
imagesc(img)
colormap(map)
c = colorbar('Ticks',1/8:1/8:1,'Limits',[0 1],...
         'TickLabels',{'1',' ','2',' ','3',' ','4',' '});
c.Label.String = 'Classes';
title(['Mapped ', img(1:end-4)]);
end

