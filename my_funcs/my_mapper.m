function [ mapped ] = my_mapper( img, mv, cm, n_feat, n_classes )

warning('off','all');
f = waitbar(0,'1','Name','Classifying data...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);
[n,m,~] = size(img);
mapped = zeros(n,m);
xv = zeros(1,n_feat);
auxP = zeros(1,n_classes);
step = 0;
steps = n * m;
for i = 1:size(mapped,1)
    for j = 1:size(mapped,2)
        xv(1:n_feat) = img(i,j,:);
        for k = 1:n_classes
            a = 1/(sqrt(2*pi*abs(det(cm(:,:,k)))));
            auxP(k) = a*exp((-0.5)*(xv-mv(k,:))*(inv(cm(:,:,k)))*(xv-mv(k,:)).');
        end
        if max(auxP) == auxP(1)
            mapped(i,j) = 1;
        elseif max(auxP) == auxP(2)
            mapped(i,j) = 2;
        elseif max(auxP) == auxP(3)
            mapped(i,j) = 3;
        elseif max(auxP) == auxP(4)
            mapped(i,j) = 4;
        end
        step = step + 1;
        if getappdata(f,'canceling')
            break
        end
        waitbar(step/steps,f,sprintf('%.2f',(step/steps)*100))
    end
end

new_map = zeros(n,m,3);
for i = 1:size(mapped, 1)
    for j = 1:size(mapped, 2)
        if mapped(i,j) == 1
            new_map(i,j,1) = 62/255;
            new_map(i,j,2) = 38/255;
            new_map(i,j,3) = 168/255;
        elseif mapped(i,j) == 2
            new_map(i,j,1) = 39/255;
            new_map(i,j,2) = 151/255;
            new_map(i,j,3) = 235/255;
        elseif mapped(i,j) == 3
            new_map(i,j,1) = 129/255;
            new_map(i,j,2) = 204/255;
            new_map(i,j,3) = 89/255;
        elseif mapped(i,j) == 4
            new_map(i,j,1) = 249/255;
            new_map(i,j,2) = 251/255;
            new_map(i,j,3) = 21/255;
        end
    end
end
delete(f)
map = [62/255, 38/255, 168/255
  39/255, 151/255, 235/255
  129/255, 204/255, 89/255
  249/255, 251/255, 21/255];
figure
imagesc(new_map)
colormap(map)
c = colorbar('Ticks',1/8:1/8:1,'Limits',[0 1],...
         'TickLabels',{'1',' ','2',' ','3',' ','4',' '});
c.Label.String = 'Classes';
title(['Mapped ', img(1:end-4)]);
warning('on','all')
end