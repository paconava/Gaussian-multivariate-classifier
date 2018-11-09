function [ Q ] = my_features( x, sow, d, theta, nof )
f = waitbar(0,'1','Name','Extracting features...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);
sowC = ceil(sow/2);
sowF = floor(sow/2);
% Initializing feature matrices
[n, m] = size(x(sowC:end-sowF, sowC:end-sowF));
Q = zeros(n, m, nof);
auxQ = zeros(1,nof);
step = 0;
steps = n * m;
for row = 1:size(Q,1)
    for col = 1:size(Q,2)
        newGL = my_glcm(x(row:row+(sow-1),col:col+(sow-1)), 16, d, theta);
        [auxQ(1), auxQ(2)] = q_features(newGL);
        Q(row,col,:) = auxQ(:);
        step = step + 1;
        if getappdata(f,'canceling')
            break
        end
        waitbar(step/steps,f,sprintf('%.2f',(step/steps)*100))
    end
end
delete(f)
end