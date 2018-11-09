clear all;
addpath(genpath('my_funcs'));
addpath(genpath('project_files'));
num_classes = 4;
num_features = 4; 
dirs = 2;
windowSize = 31;
sowC = ceil(windowSize/2);
sowF = floor(windowSize/2);
GL = 16;

%% TRAINING
load('mosaic1_train.mat');
load('training_mask.mat');
% Padding on mask to match feature image size
train_msk = training_mask(sowC:end-sowF, sowC:end-sowF);
[tm_r, tm_c] = size(train_msk);
nof = zeros(1,num_classes);
% Total classified pixels
totalnz = sum(sum(train_msk ~= 0));
% Number of pixels for each class
for i = 1:num_classes
    nof(i) = sum(sum(train_msk == i));
end

train_img = zeros(tm_r, tm_c, num_features);
mos1 = my_quantizer(mosaic1_train);
% Feature images
train_img(:,:,1:num_features/dirs) = my_features(mos1, windowSize, 1, 0, num_features/dirs);
train_img(:,:,(num_features/dirs)+1:num_features) = my_features(mos1, windowSize, 1, 90, num_features/dirs);
%Showing feature images
figure, imshow(train_img(:,:,1));
figure, imshow(train_img(:,:,2));
figure, imshow(train_img(:,:,3));
figure, imshow(train_img(:,:,4));
% Means
mean_v = zeros(num_classes, num_features);
for i = 1:num_features
    auxM = train_img(:,:,i);
    for j = 1:num_classes
        mean_v(j,i) = mean(auxM(train_msk == j));
    end
end
% Cov matrices
cov_mat = zeros(num_features, num_features, num_classes);
for i = 1:num_classes
    cov_mat(:,:,i) = my_cov(train_img, train_msk, nof(i), num_features, i);
end

mapped = my_mapper(train_img, mean_v, cov_mat, num_features, num_classes);
[correct_train, cm1] = my_error(train_msk, mapped);
figure, imagesc(mapped);
%% TESTING
load('mosaic2_test.mat');

test_img2 = zeros(tm_r, tm_c, num_features);
mos2 = my_quantizer(mosaic2_test);
% Feature images
test_img2(:,:,1:num_features/dirs) = my_features(mos2, windowSize, 1, 0, num_features/dirs);
test_img2(:,:,(num_features/dirs)+1:num_features) = my_features(mos2, windowSize, 1, 90, num_features/dirs);

mapped2 = my_mapper(test_img2, mean_v, cov_mat, num_features, num_classes);
% Percentage of success and confusion matrix
[correct_test2new, cm2new] = my_error(train_msk, mapped2);
plot_mapped(mapped2);

% Test 3
load('mosaic3_test.mat');
test_img3 = zeros(tm_r, tm_c, num_features);
mos3 = my_quantizer(mosaic3_test);
% Feature images
test_img3(:,:,1:num_features/dirs) = my_features(mos3, windowSize, 1, 0, num_features/dirs);
test_img3(:,:,(num_features/dirs)+1:num_features) = my_features(mos3, windowSize, 1, 90, num_features/dirs);

mapped3 = my_mapper(test_img3, mean_v, cov_mat, num_features, num_classes);
[correct_test3new, cm3new] = my_error(train_msk, mapped3);
plot_mapped(mapped3);
%% FINAL MATS
save('mapped.mat','mapped');
save('mapped2.mat','mapped2');
save('mapped3.mat','mapped3');
save('ct.mat','correct_train');
save('ct2.mat','correct_test2');
save('ct3.mat','correct_test3');
save('train_img.mat','train_img');
save('test_img2.mat','test_img2');
save('test_img3.mat','test_img3');