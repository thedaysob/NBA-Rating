function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 05-May-2018 16:52:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui

handles.output = hObject;

[handles.pos, handles.playerWage, handles.rating, handles.stat] = ...
    MyData('NBAstat.xlsx','NBAadvanced.xlsx','NBAwealth.xlsx');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function pickPlayerName_Callback(hObject, eventdata, handles)
% hObject    handle to pickPlayerName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.playerName = get(hObject,'string');
handles.playerPos = GetPosition(handles.playerName, handles.stat);
cla(handles.age);
cla(handles.wage);
cla(handles.ThreeD);
if strcmp(handles.playerPos, 'Player Not Found')
    fprintf('Player Not Found\n');
else
    userData = PlottingChoice(handles, handles.playerName, ...
        handles.playerPos);
    playerStat = GetPlayerStat(handles.playerName, handles.playerPos, ...
        handles);
    ax = handles.age;
    axes(ax);
    hold on;
    gscatter(userData.age, userData.rat);
    plot(handles.age, playerStat.age, playerStat.rating, 'ob');
    title(sprintf('%s Rating vs Age', handles.playerPos{:}));
    xlabel('Age');
    ylabel('Rating');
    hold off;    
    
    [yFit, coeff, rSq] = MyLinefit(userData.wage, userData.rat);
    ax = handles.wage;
    axes(ax);
    hold on;
    gscatter(userData.wage, userData.rat);
    plot(handles.wage, playerStat.wage, playerStat.rating, 'ob');
    title(sprintf('%s Rating vs Contract, rSq = %f', handles.playerPos{:}, ...
        rSq));
    xlabel('Contract');
    ylabel('Rating');
    
    plot(handles.wage, userData.wage, yFit);
    hold off

    ax = handles.ThreeD;
    axes(ax);
    hold on;
    gscatter(userData.age, userData.wage);
    title('Age vs Contract');
    xlabel('Age');
    ylabel('Contract')
    
    plot(handles.ThreeD, playerStat.age, playerStat.wage, 'ob');
    hold off  
    saveas(gcf,'graphs.jpg');
    
    fid = fopen('player stat.txt','wt');
    if fid <= 0
        error('file open unsuccessful');
    else
        fprintf(fid,'Position: %s\n', handles.playerPos{:});
        fprintf(fid,'Name\t\t\t\tRating\t\t\t\tAge\t\t\tWage\n');
        for i = 1:length(userData.rat)
            if (length(strtok(userData.players{i},'\')) > 15)
                fprintf(fid,'%s\t\t', strtok(userData.players{i},'\'));
                fprintf(fid,'%i\t\t\t', userData.rat(i));
                fprintf(fid,'%i\t\t\t', userData.age(i));
                fprintf(fid,'%i\n', userData.wage(i));
            else
                fprintf(fid,'%s\t\t\t', strtok(userData.players{i},'\'));
                fprintf(fid,'%i\t\t\t', userData.rat(i));
                fprintf(fid,'%i\t\t\t', userData.age(i));
                fprintf(fid,'%i\n', userData.wage(i));
            end
        end
    end
    fclose(fid);
end


% Hints: get(hObject,'String') returns contents of pickPlayerName as text
%        str2double(get(hObject,'String')) returns contents of pickPlayerName as a double


% --- Executes during object creation, after setting all properties.
function pickPlayerName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pickPlayerName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
