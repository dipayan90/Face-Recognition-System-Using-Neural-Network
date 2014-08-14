

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

% Last Modified by GUIDE v2.5 19-Feb-2012 16:29:18

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


while (1==1)
    choice=menu('Face Detection software',...
                'Create Database',...
                'Initialize Network',...
                'Train Network',...
                'Test on Photos',...
                'Exit');
    if (choice ==1)
        example;
    end
    if (choice == 2)
        createffnn;
    end    
    if (choice == 3)
        net = trainnet(net,ProjectedImages);
    end
    if (choice == 4)
        [OutputName,y] = Recognition(TestImage, m, A, Eigenfaces,ProjectedImages,net);
        fprintf('%d\n',y);

    SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
 	SelectedImage = imread(SelectedImage);
 	figure;
 	imshow(im)
 	title('Test Image');
 	figure,imshow(SelectedImage);
 	title('Equivalent Image');
 
 	str = strcat('Matched image is :  ',OutputName);
 	disp(str)

	end
    if (choice == 5)
        clear all;
        clc;
        close all;
        return;
    end    
end
