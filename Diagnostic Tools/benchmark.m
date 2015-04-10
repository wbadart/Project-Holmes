function varargout = benchmark(varargin)
% BENCHMARK MATLAB code for benchmark.fig
%      BENCHMARK, by itself, creates a new BENCHMARK or raises the existing
%      singleton*.
%
%      H = BENCHMARK returns the handle to a new BENCHMARK or the handle to
%      the existing singleton*.
%
%      BENCHMARK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BENCHMARK.M with the given input arguments.
%
%      BENCHMARK('Property','Value',...) creates a new BENCHMARK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before benchmark_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to benchmark_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help benchmark

% Last Modified by GUIDE v2.5 09-Apr-2015 20:36:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @benchmark_OpeningFcn, ...
                   'gui_OutputFcn',  @benchmark_OutputFcn, ...
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


% --- Executes just before benchmark is made visible.
function benchmark_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to benchmark (see VARARGIN)

% Choose default command line output for benchmark
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes benchmark wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = benchmark_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in standard.
function standard_Callback(hObject, eventdata, handles)
% hObject    handle to standard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.inputpass.String = 'abc';
handles.inputpass.Enable = 'off';
handles.timeout.String = '60';
handles.iterText.String = '5';
handles.iterSlide.Value = 5;
handles.commonBool.Value = 0;

pause(0.0001);
stats = passTester('abc', 5, 60, 1, handles);

handles.avgT.String = [num2str(stats.avgT), ' sec'];
handles.avgC.String = num2str(stats.avgC);
handles.avgPerSec.String = num2str(stats.avgPerSec);
handles.totalT.String = [num2str(sum(stats.allT)), ' sec'];
handles.totalG.String = num2str(sum(stats.allC));

handles.inputpass.Enable = 'on';
handles.inputpass.ForegroundColor = 'black';
handles.feedback.String = '';

% --- Executes on button press in custom.
function custom_Callback(hObject, eventdata, handles)
% hObject    handle to custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.inputpass.Enable = 'off';
pause(0.0001);
stats = passTester(handles.inputpass.String, str2double(handles.iterText.String),...
    str2double(handles.timeout.String), handles.alphaChoice.Value, handles);

handles.avgT.String = [num2str(stats.avgT), ' sec'];
handles.avgC.String = num2str(stats.avgC);
handles.avgPerSec.String = num2str(stats.avgPerSec);
handles.totalT.String = [num2str(sum(stats.allT)), ' sec'];
handles.totalG.String = num2str(sum(stats.allC));

handles.inputpass.Enable = 'on';
handles.inputpass.ForegroundColor = 'black';


% --- Executes during object creation, after setting all properties.
function inputpass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in standSelect.
function standSelect_Callback(hObject, eventdata, handles)
% hObject    handle to standSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns standSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from standSelect


% --- Executes during object creation, after setting all properties.
function standSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to standSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timeout_Callback(hObject, eventdata, handles)
% hObject    handle to timeout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeout as text
%        str2double(get(hObject,'String')) returns contents of timeout as a double


% --- Executes during object creation, after setting all properties.
function timeout_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in up60.
function up60_Callback(hObject, eventdata, handles)
% hObject    handle to up60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2double(handles.timeout.String);
a = a + 60;
handles.timeout.String = num2str(a);

% --- Executes on button press in down60.
function down60_Callback(hObject, eventdata, handles)
% hObject    handle to down60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2double(handles.timeout.String);
a = a - 60;
if a > 0
    handles.timeout.String = num2str(a);
else
    a = 1;
    handles.timeout.String = num2str(a);
end

% --- Executes on button press in up5.
function up5_Callback(hObject, eventdata, handles)
% hObject    handle to up5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2double(handles.timeout.String);
a = a + 5;
handles.timeout.String = num2str(a);


% --- Executes on button press in down5.
function down5_Callback(hObject, eventdata, handles)
% hObject    handle to down5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2double(handles.timeout.String);
a = a - 5;
if a > 0
    handles.timeout.String = num2str(a);
else
    a = 1;
    handles.timeout.String = num2str(a);
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over inputpass.
function inputpass_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to inputpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Toggel the "Enable" state to ON
set(hObject, 'Enable', 'On');
% Create UI control
uicontrol(handles.inputpass);
handles.inputpass.String = '';
handles.inputpass.ForegroundColor = [0 0 0];



function inputpass_Callback(hObject, eventdata, handles)
% hObject    handle to inputpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputpass as text
%        str2double(get(hObject,'String')) returns contents of inputpass as a double


% --- Executes on slider movement.
function iterSlide_Callback(hObject, eventdata, handles)
% hObject    handle to iterSlide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.iterText.String = num2str(handles.iterSlide.Value);


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
if ((0 <= a) && (a <= 20))
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


% --- Executes on selection change in alphaChoice.
function alphaChoice_Callback(hObject, eventdata, handles)
% hObject    handle to alphaChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns alphaChoice contents as cell array
%        contents{get(hObject,'Value')} returns selected item from alphaChoice


% --- Executes during object creation, after setting all properties.
function alphaChoice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alphaChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function avgC_Callback(hObject, eventdata, handles)
% hObject    handle to avgC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of avgC as text
%        str2double(get(hObject,'String')) returns contents of avgC as a double


% --- Executes during object creation, after setting all properties.
function avgC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to avgC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function avgPerSec_Callback(hObject, eventdata, handles)
% hObject    handle to avgPerSec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of avgPerSec as text
%        str2double(get(hObject,'String')) returns contents of avgPerSec as a double


% --- Executes during object creation, after setting all properties.
function avgPerSec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to avgPerSec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function totalT_Callback(hObject, eventdata, handles)
% hObject    handle to totalT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of totalT as text
%        str2double(get(hObject,'String')) returns contents of totalT as a double


% --- Executes during object creation, after setting all properties.
function totalT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to totalT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function totalG_Callback(hObject, eventdata, handles)
% hObject    handle to totalG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of totalG as text
%        str2double(get(hObject,'String')) returns contents of totalG as a double


% --- Executes during object creation, after setting all properties.
function totalG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to totalG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in max.
function max_Callback(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.inputpass.String = 'abcd';
handles.inputpass.Enable = 'off';
handles.timeout.String = '1';
handles.iterText.String = '20';
handles.iterSlide.Value = 20;
handles.commonBool.Value = 0;

pause(0.0001);
stats = passTester('abcd', 20, 1, 1, handles);

handles.avgT.String = [num2str(stats.avgT), ' sec'];
handles.avgC.String = num2str(stats.avgC);
handles.avgPerSec.String = num2str(stats.avgPerSec);
handles.totalT.String = [num2str(sum(stats.allT)), ' sec'];
handles.totalG.String = num2str(sum(stats.allC));

score = 100 * stats.avgPerSec / 400000;
handles.score.String = num2str(score);

handles.inputpass.Enable = 'on';
handles.inputpass.ForegroundColor = 'black';
handles.feedback.String = '';


% --- Executes on button press in commonBool.
function commonBool_Callback(hObject, eventdata, handles)
% hObject    handle to commonBool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of commonBool



function guess_Callback(hObject, eventdata, handles)
% hObject    handle to guess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of guess as text
%        str2double(get(hObject,'String')) returns contents of guess as a double


% --- Executes during object creation, after setting all properties.
function guess_CreateFcn(hObject, eventdata, handles)
% hObject    handle to guess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
