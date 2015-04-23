function varargout = MessageDecoderTool(varargin)
% MESSAGEDECODERTOOL MATLAB code for MessageDecoderTool.fig
%      MESSAGEDECODERTOOL, by itself, creates a new MESSAGEDECODERTOOL or raises the existing
%      singleton*.
%
%      H = MESSAGEDECODERTOOL returns the handle to a new MESSAGEDECODERTOOL or the handle to
%      the existing singleton*.
%
%      MESSAGEDECODERTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MESSAGEDECODERTOOL.M with the given input arguments.
%
%      MESSAGEDECODERTOOL('Property','Value',...) creates a new MESSAGEDECODERTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MessageDecoderTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MessageDecoderTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MessageDecoderTool

% Last Modified by GUIDE v2.5 23-Apr-2015 01:04:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MessageDecoderTool_OpeningFcn, ...
                   'gui_OutputFcn',  @MessageDecoderTool_OutputFcn, ...
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


% --- Executes just before MessageDecoderTool is made visible.
function MessageDecoderTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MessageDecoderTool (see VARARGIN)

% Choose default command line output for MessageDecoderTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MessageDecoderTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MessageDecoderTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function EncryptedText_Callback(hObject, eventdata, handles)
% hObject    handle to EncryptedText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EncryptedText as text
%        str2double(get(hObject,'String')) returns contents of EncryptedText as a double


% --- Executes during object creation, after setting all properties.
function EncryptedText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EncryptedText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DecryptedMessage_Callback(hObject, eventdata, handles)
% hObject    handle to DecryptedMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DecryptedMessage as text
%        str2double(get(hObject,'String')) returns contents of DecryptedMessage as a double


% --- Executes during object creation, after setting all properties.
function DecryptedMessage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DecryptedMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TEdit_Callback(hObject, eventdata, handles)
% hObject    handle to TEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TEdit as text
%        str2double(get(hObject,'String')) returns contents of TEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function TEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function UEdit_Callback(hObject, eventdata, handles)
% hObject    handle to UEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of UEdit as text
%        str2double(get(hObject,'String')) returns contents of UEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function UEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function VEdit_Callback(hObject, eventdata, handles)
% hObject    handle to VEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of VEdit as text
%        str2double(get(hObject,'String')) returns contents of VEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function VEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WEdit_Callback(hObject, eventdata, handles)
% hObject    handle to WEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WEdit as text
%        str2double(get(hObject,'String')) returns contents of WEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function WEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function XEdit_Callback(hObject, eventdata, handles)
% hObject    handle to XEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of XEdit as text
%        str2double(get(hObject,'String')) returns contents of XEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function XEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function YEdit_Callback(hObject, eventdata, handles)
% hObject    handle to YEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YEdit as text
%        str2double(get(hObject,'String')) returns contents of YEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function YEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ZEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ZEdit as text
%        str2double(get(hObject,'String')) returns contents of ZEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function ZEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NEdit_Callback(hObject, eventdata, handles)
% hObject    handle to NEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NEdit as text
%        str2double(get(hObject,'String')) returns contents of NEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function NEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PEdit_Callback(hObject, eventdata, handles)
% hObject    handle to PEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEdit as text
%        str2double(get(hObject,'String')) returns contents of PEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function PEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QEdit_Callback(hObject, eventdata, handles)
% hObject    handle to QEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QEdit as text
%        str2double(get(hObject,'String')) returns contents of QEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function QEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function REdit_Callback(hObject, eventdata, handles)
% hObject    handle to REdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of REdit as text
%        str2double(get(hObject,'String')) returns contents of REdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function REdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to REdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OEdit_Callback(hObject, eventdata, handles)
% hObject    handle to OEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OEdit as text
%        str2double(get(hObject,'String')) returns contents of OEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function OEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LEdit_Callback(hObject, eventdata, handles)
% hObject    handle to LEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LEdit as text
%        str2double(get(hObject,'String')) returns contents of LEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function LEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MEdit_Callback(hObject, eventdata, handles)
% hObject    handle to MEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEdit as text
%        str2double(get(hObject,'String')) returns contents of MEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function MEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function KEdit_Callback(hObject, eventdata, handles)
% hObject    handle to KEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of KEdit as text
%        str2double(get(hObject,'String')) returns contents of KEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function KEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to KEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function JEdit_Callback(hObject, eventdata, handles)
% hObject    handle to JEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of JEdit as text
%        str2double(get(hObject,'String')) returns contents of JEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function JEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to JEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IEdit_Callback(hObject, eventdata, handles)
% hObject    handle to IEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IEdit as text
%        str2double(get(hObject,'String')) returns contents of IEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function IEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HEdit_Callback(hObject, eventdata, handles)
% hObject    handle to HEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HEdit as text
%        str2double(get(hObject,'String')) returns contents of HEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function HEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CEdit_Callback(hObject, eventdata, handles)
% hObject    handle to CEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CEdit as text
%        str2double(get(hObject,'String')) returns contents of CEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function CEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EEdit_Callback(hObject, eventdata, handles)
% hObject    handle to EEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EEdit as text
%        str2double(get(hObject,'String')) returns contents of EEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function EEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FEdit_Callback(hObject, eventdata, handles)
% hObject    handle to FEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FEdit as text
%        str2double(get(hObject,'String')) returns contents of FEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function FEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GEdit_Callback(hObject, eventdata, handles)
% hObject    handle to GEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GEdit as text
%        str2double(get(hObject,'String')) returns contents of GEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function GEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DEdit_Callback(hObject, eventdata, handles)
% hObject    handle to DEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DEdit as text
%        str2double(get(hObject,'String')) returns contents of DEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function DEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BEdit_Callback(hObject, eventdata, handles)
% hObject    handle to BEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BEdit as text
%        str2double(get(hObject,'String')) returns contents of BEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function BEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AEdit_Callback(hObject, eventdata, handles)
% hObject    handle to AEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AEdit as text
%        str2double(get(hObject,'String')) returns contents of AEdit as a double
MessageDecoderRankFunc(handles, true);

% --- Executes during object creation, after setting all properties.
function AEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DecodeButton.
function DecodeButton_Callback(hObject, eventdata, handles)
% hObject    handle to DecodeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MessageDecoderRankFunc(handles, false);
handles.DecryptedMessage.Enable = 'on';


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over EncryptedText.
function EncryptedText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to EncryptedText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Toggel the "Enable" state to ON
set(hObject, 'Enable', 'On');
% Create UI control
uicontrol(handles.EncryptedText);
handles.EncryptedText.String = '';



function SEdit_Callback(hObject, eventdata, handles)
% hObject    handle to SEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SEdit as text
%        str2double(get(hObject,'String')) returns contents of SEdit as a double
MessageDecoderRankFunc(handles, true);