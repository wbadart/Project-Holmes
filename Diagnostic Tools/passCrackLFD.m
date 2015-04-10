function [ results ] = passCrackLFD(realpass, timeout, alphabet, handles)

% passCrackLF.m (LITE, function, diagnostics version)

% This is the script passCrackLITE.m in function form.  This allows it to
% be called by passTester.m.  Interesting note: other than the script vs.
% function format, the code is identical, yet this file cracks passwords
% roughly 3x faster.

% Author:       Will Badart
%               See git for version control

%% Set Parameters

switch alphabet
    case 1
        alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*';
    case 2
        alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\|";:/?.>''';
    case 3
        alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\|";:/?.>'',<ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜ¢£¥?ƒáíóúñÑªº¿¬½¼¡«»ßµ°·²';
end

guess = ' ';
counter = 0;
found = false;

%% Crack Password
tic;

if handles.commonBool.Value
    filename = 'commonPass.txt';
    delimiter = '';
    formatSpec = '%s%[^\n\r]';
    fileID = fopen(filename,'r');
    dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
    fclose(fileID);
    password = dataArray{:, 1};
    clearvars filename delimiter formatSpec fileID dataArray ans;
    
    for i = 1:length(password)
        guess = password(i);
        counter = counter + 1;
        if strcmp(guess, realpass) == 1
            guess = guess{:};
            found = true;
            break
        end
    end
end

if ~strcmp(guess, realpass)
maxPassLength = 8; %input('Max length of password to check: ');
for l = 1:maxPassLength,
    
    % Number of possible password for this length
    combinationCount = length(alphabet)^l;
    
    % Put all possible combination in kind of a counter where each
    % digit can run up to the number of elements in the alphabet
    coordinate = cell(1,l);
    size = length(alphabet) * ones(1,l);
    
    for index = 1:combinationCount,
        
        % transform linear index into coordinate
        [coordinate{:}] = ind2sub(size, index);
        % build password from current coordinate
        guess = cellfun(@(i)alphabet(i), coordinate);
        if (strcmp(guess, realpass)) || (toc >= timeout)
            break;
        end
    end % ends for index=1:combinationCount
    
    if (strcmp(guess, realpass)) || (toc >= timeout)
        break;
    end
end % ends for l=1:maxPassLength

end

%disp(['The password is: ', guess]);
tElapsed = toc;
if ~handles.commonBool.Value
    counter = length(alphabet) ^ l + index; %brute force guesses only
else
    if ~found
        counter = 10000 + length(alphabet) ^ l + index;
    end
end

results.time = tElapsed;
results.guess = guess;
results.counter = counter;

end