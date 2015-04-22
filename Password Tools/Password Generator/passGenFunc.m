function [] = passGenFunc(handles, genbool)
% passGenFunc.m
% Takes input parameters from GUI and uses them to generate a random
% password.
% Author:       Will Badart
% Last Edited:  See git for version control.


%% Set Parameters

complexity = handles.complexSlide.Value;
chars.lowers = 'abcdefghijklmnopqrstuvwxyz';
chars.uppers = upper(chars.lowers);
chars.nums = '1234567890';
chars.spec = '!@#$%^&*()-_=+[{]}\|;:''",<.>/?';
passLength = str2double(handles.passLen.String);

%% Determine Complexity Level

if (complexity <= 0.25)
    level = 1;
elseif ((complexity > 0.25) && (complexity <= 0.5))
    level = 2;
elseif ((complexity > 0.5) && (complexity <= 0.75))
    level = 3;
elseif ((complexity > 0.75) && (complexity <= 1))
    level = 4;
else
    disp('Error: complexity not in silder range');
end


%% Show Appropriate Description

switch level
    case 1
        handles.complexDesc.String = 'Poor';
        handles.complexDesc2.String = ['-all lower-case letters'; ...
            '-not recommended       '];
        alphabet = [chars.lowers];
    case 2
        handles.complexDesc.String = 'Not great';
        handles.complexDesc2.String = ['-upper and lower case letters'; ...
            '-still not recommended       '];
        alphabet = [chars.lowers, chars.uppers];
    case 3
        handles.complexDesc.String = 'Good';
        handles.complexDesc2.String = ['-uses letters and numbers  '; ...
            '-getting there, not perfect'];
        alphabet = [chars.lowers, chars.uppers, chars.nums];
    case 4
        handles.complexDesc.String = 'Great';
        handles.complexDesc2.String = ['-uses letters, numbers, and symbols'; ...
            '-recommended setting               '];
        alphabet = [chars.lowers, chars.uppers, chars.nums, chars.spec];
end

if genbool
    password = generator(alphabet, passLength);
    handles.generatedPassword.String = password;
    handles.generatedPassword.ForegroundColor = [0 0 0];
end
