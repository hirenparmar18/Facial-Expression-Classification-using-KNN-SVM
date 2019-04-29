function varargout = add_new_im(varargin)
% ADD_NEW_IM MATLAB code for add_new_im.fig
%      ADD_NEW_IM, by itself, creates a new ADD_NEW_IM or raises the existing
%      singleton*.
%
%      H = ADD_NEW_IM returns the handle to a new ADD_NEW_IM or the handle to
%      the existing singleton*.
%
%      ADD_NEW_IM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADD_NEW_IM.M with the given input arguments.
%
%      ADD_NEW_IM('Property','Value',...) creates a new ADD_NEW_IM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before add_new_im_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to add_new_im_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help add_new_im

% Last Modified by GUIDE v2.5 24-May-2017 18:34:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @add_new_im_OpeningFcn, ...
                   'gui_OutputFcn',  @add_new_im_OutputFcn, ...
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


% --- Executes just before add_new_im is made visible.
function add_new_im_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to add_new_im (see VARARGIN)

% Choose default command line output for add_new_im
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
expressionsres = {'HAPPY','SAD','SURPRISE','ANGER','DISGUST','FEAR','NEUTRAL'};
set(handles.popupmenu1,'String',expressionsres')

% UIWAIT makes add_new_im wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = add_new_im_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Im
% Prompt user to select input image
[fn, fp] = uigetfile('*.jpg;*.png;*.tiff;*.bmp;*.pgm','Please select input image');

% Create imagepath
impath = [fp fn];

% Read image
Im = imread(impath);

axes(handles.axes1)
imshow(Im);
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Im
global Ic
Ic = imcrop(Im);
axes(handles.axes2)
imshow(Ic)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ic
expressions = {'HA','SA','SU','AN','DI','FE','NE'};

idx = get(handles.popupmenu1,'Value');
load idxx
 
impath = ['jaffe/Newim.' num2str(idxx) '3.tiff'];

impath(10:11)=expressions{idx};
imwrite(Ic,impath);

msgbox('image saved in database');

 