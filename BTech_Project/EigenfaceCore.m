function [m, A, Eigenfaces,ProjectedImages,ProjectedTestImage,target,grtest] = EigenfaceCore(T,TestImage)
%Principle Component Analysis (PCA)is used to determine the most 
% discriminating features between images of faces.
%
% Description: This function gets a 2D matrix, containing all training image vectors
% and returns 3 outputs which are extracted from training database.
%
% Argument:      T                      - A 2D matrix, containing all 1D image vectors.
%                                         Suppose all P images in the training database 
%                                         have the same size of MxN. So the length of 1D 
%                                         column vectors is M*N and 'T' will be a MNxP 2D matrix.
% 
% Returns:       m                      - (M*Nx1) Mean of the training database
%                Eigenfaces             - (M*Nx(P-1)) Eigen vectors of the covariance matrix of the training database
%                A                      - (M*NxP) Matrix of centered image vectors
%                ProjectedImages        - Projection of database of images
%                                          into facespace
                 
 
%Calculating the mean image 
m = mean(T,2); % Computing the average face image m = (1/P)*sum(Tj's)    (j = 1 : P)
Train_Number = size(T,2);

%Calculating the deviation of each image from mean image
A = [];  
for i = 1 : Train_Number
    temp = double(T(:,i)) - m; % Computing the difference image for each image in the training set Ai = Ti - m
    A = [A temp]; % Merging all centered images
end

% Since the number of training images (P) is usually less than the number
% of pixels (M*N), the most non-zero eigenvalues that can be found are equal
% to P-1. So we can calculate eigenvalues of A'*A (a PxP matrix) instead of
% A*A' (a M*NxM*N matrix). It is clear that the dimensions of A*A' is much
% larger that A'*A. So the dimensionality will decrease.

L = A'*A; % L is the surrogate of covariance matrix C=A*A'.
[V D] = eig(L); % Diagonal elements of D are the eigenvalues for both L=A'*A and C=A*A'.

%Calculating the eigenvectors of covariance matrix 'C'
% Eigenvectors of covariance matrix C (or so-called "Eigenfaces")
% can be recovered from L's eiegnvectors.
Eigenfaces = A * V; % A: centered image vectors
save EF.mat Eigenfaces
ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); % Projection of centered images into facespace
    ProjectedImages = [ProjectedImages temp]; 
end
save pi.mat ProjectedImages
InputImage = imread(TestImage);
grtest=rgb2gray(InputImage);
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; % Centered test image
ProjectedTestImage = Eigenfaces'*Difference; % Test image feature vector
target=ProjectedTestImage';
save pti1.mat ProjectedTestImage
save tgt.mat target