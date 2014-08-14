function [OutputName] = Recognition(Eigenfaces,ProjectedImages,ProjectedTestImage)
% Recognizing step....
%
% Description: This function compares two faces by projecting the images into facespace and 
% measuring the Euclidean distance between them.
%
% Argument:      TestImage              - Path of the input test image
%
%                m                      - (M*Nx1) Mean of the training
%                                         database, which is output of 'EigenfaceCore' function.
%
%                Eigenfaces             - (M*Nx(P-1)) Eigen vectors of the
%                                         covariance matrix of the training
%                                         database, which is output of 'EigenfaceCore' function.

% Returns:       OutputName             - Name of the recognized image in the training database.



% All centered images are projected into facespace by multiplying in
% Eigenface basis's. Projected vector of each face will be its corresponding
% feature vector.

Train_Number = size(Eigenfaces,2);
save dipayan1.mat ProjectedTestImage

% Extracting the PCA features from test image

%Calculating Euclidean distances and getting input from neural network
% Euclidean distances between the projected test image and the projection
% of all centered training images are calculated. Test image is
% supposed to have minimum distance with its corresponding image in the
% trained "training database" from neural network.

%net=NET
%y=sim(net,ProjectedTestImage);
Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end

[Euc_dist_min , Recognized_index] = min(Euc_dist);
save MINEUD.mat Euc_dist_min 
OutputName = strcat(int2str(Recognized_index),'.jpg');

