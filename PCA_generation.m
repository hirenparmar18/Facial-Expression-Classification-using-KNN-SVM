function [v, trainWeights, fbgAvgFace]= PCA_generation(fbgTrainImgs)
numVectors = min([30,size(fbgTrainImgs,2)]);

fbgAvgFace = mean(fbgTrainImgs,2);

% Ignore the first 10 eigenfaces
eigWeights(1:numVectors) = 1;
% eigWeights(1:10) = 0; % Ignore first 10 eigenfaces by setting to zero



% Remove the mean of the images (definitely batch mode)
for i = 1:size(fbgTrainImgs, 2)
	fbgTrainImgs(:,i) = fbgTrainImgs(:,i) - fbgAvgFace;
end

% Do PCA using SVD (Singular Value Decomposition)
[U,SV] = svd(fbgTrainImgs,'econ');
v = U(:,1:numVectors); % Take the top eigenvectors as eigenfaces

% Apply weights to the eigenvectors (so we can ignore the top 10)

for i = 1:numVectors
    v(:,i) = v(:,i)*eigWeights(i);
end


% Create training weights for each image (representation of each face in
% the eigenspace) as a linear combination of each eigenface.
trainWeights = v'*fbgTrainImgs;

% This is the data we need to perform recognition (during testing phase)
fbgTrainMem{1} = v;
fbgTrainMem{2} = 0;
fbgTrainMem{3} = trainWeights;
fbgTrainMem{4} = fbgAvgFace;