function varargout = passGen2(varargin)
% PASSGEN2 MATLAB code for passGen2.fig
%      PASSGEN2, by itself, creates a new PASSGEN2 or raises the existing
%      singleton*.
%
%      H = PASSGEN2 returns the handle to a new PASSGEN2 or the handle to
%      the existing singleton*.
%
%      PASSGEN2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PASSGEN2.M with the given input arguments.
%
%      PASSGEN2('Property','Value',...) creates a new PASSGEN2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before passGen2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to passGen2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help passGen2

% Author:       Will Badart
% Last Edited:  See git for version control.

% Last Modified by GUIDE v2.5 28-Feb-2015 17:17:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @passGen2_OpeningFcn, ...
                   'gui_OutputFcn',  @passGen2_OutputFcn, ...
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


% --- Executes just before passGen2 is made visible.
function passGen2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to passGen2 (see VARARGIN)

% Choose default command line output for passGen2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes passGen2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
passGenFunc(handles, 0);


% --- Outputs from this function are returned to the command line.
function varargout = passGen2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in go.
function go_Callback(hObject, eventdata, handles)
% hObject    handle to go (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
passGenFunc(handles, 1);


% --- Executes on slider movement.
function complexSlide_Callback(hObject, eventdata, handles)
% hObject    handle to complexSlide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
passGenFunc(handles, 0);


% --- Executes during object creation, after setting all properties.
function complexSlide_CreateFcn(hObject, eventdata, handles)
% hObject    handle to complexSlide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function generatedPassword_Callback(hObject, eventdata, handles)
% hObject    handle to generatedPassword (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of generatedPassword as text
%        str2double(get(hObject,'String')) returns contents of generatedPassword as a double


% --- Executes during object creation, after setting all properties.
function generatedPassword_CreateFcn(hObject, eventdata, handles)
% hObject    handle to generatedPassword (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function passLen_Callback(hObject, eventdata, handles)
% hObject    handle to passLen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of passLen as text
%        str2double(get(hObject,'String')) returns contents of passLen as a double


% --- Executes during object creation, after setting all properties.
function passLen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to passLen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in increase.
function increase_Callback(hObject, eventdata, handles)
% hObject    handle to increase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
passLenNum = str2double(handles.passLen.String);
passLenNum = passLenNum + 1;
handles.passLen.String = num2str(passLenNum);

% --- Executes on button press in decrease.
function decrease_Callback(hObject, eventdata, handles)
% hObject    handle to decrease (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
passLenNum = str2double(handles.passLen.String);
if passLenNum > 1
    passLenNum = passLenNum - 1;
end
handles.passLen.String = num2str(passLenNum);


% --- Executes on button press in cpyBtn.
function cpyBtn_Callback(hObject, eventdata, handles)
% hObject    handle to cpyBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clipboard('copy', handles.generatedPassword.String);


% --- Executes on button press in clrBtn.
function clrBtn_Callback(hObject, eventdata, handles)
% hObject    handle to clrBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.generatedPassword.String = 'password';
handles.generatedPassword.ForegroundColor = [0.831 0.816 0.784];
