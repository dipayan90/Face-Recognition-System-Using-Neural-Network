
function varargout = FaceRecognition(varargin)
% FACERECOGNITION M-file for FaceRecognition.fig
%      FACERECOGNITION, by itself, creates a new FACERECOGNITION or raises the existing
%      singleton*.
%
%      H = FACERECOGNITION returns the handle to a new FACERECOGNITION or the handle to
%      the existing singleton*.
%
%      FACERECOGNITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FACERECOGNITION.M with the given input arguments.
%
%      FACERECOGNITION('Property','Value',...) creates a new FACERECOGNITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FaceRecognition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FaceRecognition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FaceRecognition

% Last Modified by GUIDE v2.5 24-Mar-2012 17:40:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FaceRecognition_OpeningFcn, ...
                   'gui_OutputFcn',  @FaceRecognition_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before FaceRecognition is made visible.
function FaceRecognition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FaceRecognition (see VARARGIN)

% Choose default command line output for FaceRecognition
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FaceRecognition wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FaceRecognition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf, 'visible','off')

% question for password
%c = cell(1)
password='administrator';
prompt = {'Please enter administrator password'};
dlg_title = 'Password';
num_lines = 1;
def = {'********','hsv'};
answer_x = inputdlg(prompt,dlg_title,num_lines,def);
answer_xx=cell2struct(answer_x, 'word',1);
answer=answer_xx.word;

if answer==password
    set(gcf, 'visible','on')
else
    close all
end
while (1==1)
    choice=menu('Face Recognition system for final year UG project',...
                'Create Database of Faces',...
                'Initialize Network for training',...
                'Train Network for training',...
                'Test on Photos and find out',...
                'Exit');
    if (choice ==1)
        dbinit;
    end
    if (choice == 2)
        createffnn;
    end    
    if (choice == 3)
        net = trainnet(net,ProjectedImages,target);
    end
    if (choice == 4)
        [OutputName] = Recognition(Eigenfaces,ProjectedImages,ProjectedTestImage);
        
       

    SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
 	SelectedImage = imread(SelectedImage);
 	
    
    GR1=rgb2gray(im);
    ipcol=reshape(GR1,36000,1);
    ipmean=mean(ipcol);
    
 	save TEST.mat SelectedImage
    GR2=rgb2gray(SelectedImage);
 	
    Diff=imabsdiff(GR1,GR2);
    Dcol=reshape(Diff,36000,1);
    Dmean=mean(Dcol);
    fprintf('%d\n',Dmean);
    if(Dmean<25)
    figure;
 	imshow(im)
    title('Test Image');
    figure,imshow(SelectedImage);
    title('Equivalent Image');
    str = strcat('Matched image is :  ',OutputName);
 	disp(str)
    fprintf('The percentage Error is: %d\n',((Dmean/ipmean)*100));
    fprintf('The match Percentage is thus!!:%d\n',(100-((Dmean/ipmean)*100)));
    else
    figure;
 	imshow(im)
    title('Test Image');
    img=imread('Unrecog.png','png');
    figure;
    imshow(img);
    title('Your image Doesnot match');
    warning('Your Image doesnot match');
    end

	end
    if (choice == 5)
        clear all;
        clc;
        close all;
        return;
    end    
end



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf, 'visible','off')

% question for password
%c = cell(1)
password='user';
prompt = {'Please enter user password'};
dlg_title = 'Password';
num_lines = 1;
def = {'********','hsv'};
answer_x = inputdlg(prompt,dlg_title,num_lines,def);
answer_xx=cell2struct(answer_x, 'word',1);
answer=answer_xx.word;

if answer==password
    set(gcf, 'visible','on')
else
    close all
end
while (1==1)
    choice=menu('Face Recognition system for final year UG project',...
                'Create Database of Faces',...
                'Initialize Network for training',...
                'Train Network for training',...
                'Test on Photos and find out',...
                'Exit');
    if (choice ==1)
        dbinit;
    end
    if (choice == 2)
        createffnn;
    end    
    if (choice == 3)
        net = trainnet(net,ProjectedImages,target);
    end
    if (choice == 4)
        [OutputName] = Recognition(Eigenfaces,ProjectedImages,ProjectedTestImage);
        
       

    SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
 	SelectedImage = imread(SelectedImage);
 	
    
    GR1=rgb2gray(im);
    ipcol=reshape(GR1,36000,1);
    ipmean=mean(ipcol);
    
 	save TEST.mat SelectedImage
    GR2=rgb2gray(SelectedImage);
 	
    Diff=imabsdiff(GR1,GR2);
    Dcol=reshape(Diff,36000,1);
    Dmean=mean(Dcol);
    fprintf('%d\n',Dmean);
    if(Dmean<25)
    figure;
 	imshow(im)
    title('Test Image');
    figure,imshow(SelectedImage);
    title('Equivalent Image');
    str = strcat('Matched image is :  ',OutputName);
 	disp(str)
    fprintf('The percentage Error is: %d\n',((Dmean/ipmean)*100));
    fprintf('The match Percentage is thus!!:%d\n',(100-((Dmean/ipmean)*100)));
    else
    figure;
 	imshow(im)
    title('Test Image');
    img=imread('Unrecog.png','png');
    figure;
    imshow(img);
    title('Your image Doesnot match');
    warning('Your Image doesnot match');
    end

	end
    if (choice == 5)
        clear all;
        clc;
        close all;
        return;
    end    
end

