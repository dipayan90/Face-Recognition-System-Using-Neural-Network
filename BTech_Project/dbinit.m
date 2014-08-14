          
TrainDatabasePath = uigetdir('D:\Program Files\MATLAB\R2006a\work', 'Select training database path' );
TestDatabasePath = uigetdir('D:\Program Files\MATLAB\R2006a\work', 'Select test database path');

prompt = {'Enter test image name (a number between 1 to 10):'};
dlg_title = 'Input of PCA-Based Face Recognition System';
num_lines= 1;
def = {'1'};

TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
im = imread(TestImage);

[T,mean_image,Z]= CreateDatabase(TrainDatabasePath);
figure(1);imshow(mean_image)
title('Mean Image');
[m, A, Eigenfaces,ProjectedImages,ProjectedTestImage,target,grtest] = EigenfaceCore(T,TestImage);
eigface=imabsdiff(grtest,mean_image);
figure(2);imshow(eigface)
Title('Eigen face');