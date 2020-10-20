function varargout = GUIAssignment3(varargin)
% GUIASSIGNMENT3 MATLAB code for GUIAssignment3.fig
%      GUIASSIGNMENT3, by itself, creates a new GUIASSIGNMENT3 or raises the existing
%      singleton*.
%
%      H = GUIASSIGNMENT3 returns the handle to a new GUIASSIGNMENT3 or the handle to
%      the existing singleton*.
%
%      GUIASSIGNMENT3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIASSIGNMENT3.M with the given input arguments.
%
%      GUIASSIGNMENT3('Property','Value',...) creates a new GUIASSIGNMENT3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIAssignment3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIAssignment3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIAssignment3

% Last Modified by GUIDE v2.5 29-Mar-2020 22:31:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIAssignment3_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIAssignment3_OutputFcn, ...
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


% --- Executes just before GUIAssignment3 is made visible.
function GUIAssignment3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIAssignment3 (see VARARGIN)

% Choose default command line output for GUIAssignment3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIAssignment3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIAssignment3_OutputFcn(hObject, eventdata, handles) 
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
global I
[filename pathname] = uigetfile('*.jpg;*.png;*.tif','Choose any file');
I = imread([pathname,filename]);
I = imresize(I,[400,400]);
imwrite(I,i1);
axes(handles.axes1);
imshow(I);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
Ibw = im2bw(I);
%figure, imshow(Ibw);
Ibw = imfill(Ibw, 'holes');
Ibw = medfilt2(Ibw,[9 9],'symmetric');
se10 = strel('disk',10);
Ibw = imclose(Ibw,se10);
%figure, imshow(Ibw);
Ilabel = logical(Ibw);
stat = regionprops(Ilabel, 'centroid');
%figure, imshow(I); 
axes(handles.axes3);
imshow(I)

hold on;
for x = 1: numel(stat)
    plot(stat(x).Centroid(1), stat(x).Centroid(2), 'ro');
end


% --- Executes during object deletion, before destroying properties.
function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3
