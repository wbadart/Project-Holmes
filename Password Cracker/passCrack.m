function varargout = passCrack(varargin)
% PASSCRACK MATLAB code for passCrack.fig
%      PASSCRACK, by itself, creates a new PASSCRACK or raises the existing
%      singleton*.
%
%      H = PASSCRACK returns the handle to a new PASSCRACK or the handle to
%      the existing singleton*.
%
%      PASSCRACK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PASSCRACK.M with the given input arguments.
%
%      PASSCRACK('Property','Value',...) creates a new PASSCRACK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before passCrack_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to passCrack_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help passCrack

% Last Modified by GUIDE v2.5 01-Mar-2015 16:32:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @passCrack_OpeningFcn, ...
                   'gui_OutputFcn',  @passCrack_OutputFcn, ...
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


% --- Executes just before passCrack is made visible.
function passCrack_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to passCrack (see VARARGIN)

% Choose default command line output for passCrack
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes passCrack wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = passCrack_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function passwordIn_Callback(hObject, eventdata, handles)
% hObject    handle to passwordIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of passwordIn as text
%        str2double(get(hObject,'String')) returns contents of passwordIn as a double


% --- Executes during object creation, after setting all properties.
function passwordIn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to passwordIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in guessbool.
function guessbool_Callback(hObject, eventdata, handles)
% hObject    handle to guessbool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of guessbool
if handles.guessbool.Value == 0
    handles.currentGuess.String = '';
end

% --- Executes on button press in go.
function go_Callback(hObject, eventdata, handles)
% hObject    handle to go (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(handles.passwordIn.Enable, 'on')
    if isempty(handles.passwordIn.String) == 0
        handles.passwordIn.Enable = 'off';
        pause(0.0000000000000001);
        crackerFunc(handles);
    end
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over passwordIn.
function passwordIn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to passwordIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Toggel the "Enable" state to ON
set(hObject, 'Enable', 'On');
% Create UI control
uicontrol(handles.passwordIn);
handles.passwordIn.String = '';
handles.passwordIn.ForegroundColor = [0 0 0];
