function varargout = combineTool(varargin)
% COMBINETOOL MATLAB code for combineTool.fig
%      COMBINETOOL, by itself, creates a new COMBINETOOL or raises the existing
%      singleton*.
%
%      H = COMBINETOOL returns the handle to a new COMBINETOOL or the handle to
%      the existing singleton*.
%
%      COMBINETOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMBINETOOL.M with the given input arguments.
%
%      COMBINETOOL('Property','Value',...) creates a new COMBINETOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before combineTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to combineTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help combineTool

% Last Modified by GUIDE v2.5 20-Apr-2015 16:34:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @combineTool_OpeningFcn, ...
                   'gui_OutputFcn',  @combineTool_OutputFcn, ...
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


% --- Executes just before combineTool is made visible.
function combineTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to combineTool (see VARARGIN)

% Choose default command line output for combineTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes combineTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = combineTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function baseName_Callback(hObject, eventdata, handles)
% hObject    handle to baseName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of baseName as text
%        str2double(get(hObject,'String')) returns contents of baseName as a double


% --- Executes during object creation, after setting all properties.
function baseName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baseName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browseBase.
function browseBase_Callback(hObject, eventdata, handles)
% hObject    handle to browseBase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.txt','Select dictionary text file');
handles.baseName.String = [PathName, FileName];


function additionName_Callback(hObject, eventdata, handles)
% hObject    handle to additionName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of additionName as text
%        str2double(get(hObject,'String')) returns contents of additionName as a double


% --- Executes during object creation, after setting all properties.
function additionName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to additionName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browseAdd.
function browseAdd_Callback(hObject, eventdata, handles)
% hObject    handle to browseAdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.txt','Select dictionary text file');
handles.additionName.String = [PathName, FileName];


function outputName_Callback(hObject, eventdata, handles)
% hObject    handle to outputName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outputName as text
%        str2double(get(hObject,'String')) returns contents of outputName as a double


% --- Executes during object creation, after setting all properties.
function outputName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mergeButton.
function mergeButton_Callback(hObject, eventdata, handles)
% hObject    handle to mergeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ((~isempty(handles.outputName.String)) && (~isempty(handles.baseName.String)) && (~isempty(handles.additionName.String)))
%     handles.baseName.Enable = 'off';
%     handles.browseBase.Enable = 'off';
%     handles.additionName.Enable = 'off';
%     handles.browseAdd.Enable = 'off';
%     handles.outputName.Enable = 'off';
%     handles.mergeButton.Enable = 'off';
%     handles.iterText.Enable = 'off';
%     handles.iterSlide.Enable = 'off';
    
    dictCombine(handles.baseName.String, handles.additionName.String, handles.outputName.String, handles);
    
%     handles.baseName.Enable = 'on';
%     handles.browseBase.Enable = 'on';
%     handles.additionName.Enable = 'on';
%     handles.browseAdd.Enable = 'on';
%     handles.outputName.Enable = 'on';
%     handles.mergeButton.Enable = 'on';
%     handles.iterText.Enable = 'on';
%     handles.iterSlide.Enable = 'on';
end


% --- Executes on slider movement.
function iterSlide_Callback(hObject, eventdata, handles)
% hObject    handle to iterSlide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.iterText.String = num2str(round(handles.iterSlide.Value));
handles.iterSlide.Value = round(handles.iterSlide.Value);

% --- Executes during object creation, after setting all properties.
function iterSlide_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterSlide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function iterText_Callback(hObject, eventdata, handles)
% hObject    handle to iterText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterText as text
%        str2double(get(hObject,'String')) returns contents of iterText as a double
a = str2double(handles.iterText.String);
if ((a >= handles.iterSlide.Min) && (a <= handles.iterSlide.Max))
    handles.iterSlide.Value = a;
end

% --- Executes during object creation, after setting all properties.
function iterText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
