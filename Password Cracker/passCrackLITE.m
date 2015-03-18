% passCrack-lite.m

% Takes user inputted password and breaks it as fast as possible.  Doesn't
% include all the features of the full passCrack program.

% Author:       Will Badart
%               See git for version control

clear;
clc;

%% Import Password Library

filename = 'commonPass.txt';
delimiter = '';
formatSpec = '%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
password = dataArray{:, 1};
clearvars filename delimiter formatSpec fileID dataArray ans;

%% Set Parameters

realpass = input('Input password: ', 's');
alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\|";:/?.>'',<ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜ¢£¥?ƒáíóúñÑªº¿¬½¼¡«»ßµ°·²';
guess = ' ';
counter = 0;
%timeout = input('Max time (seconds): ');

%% Crack Password
tic;
% checks password against the library
if counter <= 0
    for i = 1:length(password)
        guess = password(i);
        if strcmp(guess, realpass) == 1
            guess = guess{:};
            break
        end
    end
end

% if password isn't found in library:
if strcmp(guess, realpass) == 0
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
            
            if (strcmp(guess, realpass)) %|| (toc(tStart) >= timeout))
                break;
            end
        end % ends for index=1:combinationCount
        
        if (strcmp(guess, realpass)) %|| (toc(tStart) >= timeout))
            break;
        end
    end % ends for l=1:maxPassLength
end % ends if strcmp(guess, realpass) == 0

disp(['The password is: ', guess]);
toc