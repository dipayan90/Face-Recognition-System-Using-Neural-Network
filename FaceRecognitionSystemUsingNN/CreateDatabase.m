function [T,mean_image,Z] = CreateDatabase(TrainDatabasePath)
% Align a set of face images (the training set T1, T2, ... , TM )
%
% Description: This function reshapes all 2D images of the training database
% into 1D column vectors. Then, it puts these 1D column vectors in a row to 
% construct 2D matrix 'T'.
%  
% 
% Argument:     TrainDatabasePath      - Path of the training database
%
% Returns:      T                      - A 2D matrix, containing all 1D image vectors.
%                                        Suppose all P images in the training database 
%                                        have the same size of MxN. So the length of 1D 
%                                        column vectors is MN and 'T' will
%                                        be a MNxP 2D matrix.
%               Mean_imag              - Mean Image of all the images.
TrainFiles = dir(TrainDatabasePath);
Train_Number = 0;

for i = 1:size(TrainFiles,1)
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1; % Number of all images in the training database
    end
end


 Z = [];
 T = [];
for i = 1 : Train_Number
    
    str = int2str(i);
    str = strcat('\',str,'.jpg');
    str = strcat(TrainDatabasePath,str);
    
    img = imread(str);
    img = rgb2gray(img);
    
    [irow icol] = size(img);
    temp1= reshape(img,irow*icol,1);
    temp = reshape(img',irow*icol,1);   % Reshaping 2D images into 1D image vectors
    Z = [Z temp1];
    T = [T temp]; % 'T' grows after each turn                    
end
for i=1:Train_Number-17
    Z(:,i+1)=Z(:,i)+Z(:,i+1);
end
mean_imag=Z(:,Train_Number-17)./(Train_Number-17);
mean_image=reshape(mean_imag,200,180);