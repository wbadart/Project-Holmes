% cracker.m

% This program brute-force cracks a password.  What I'm thinking we can do
% initially is start small, so have like a 2 character password, and see
% what we can do to break that.  Once we have our cracking code on the
% page, then we can play around with the password, perhaps by increasing
% length or complexity, or having the program generate a password.

% Authors: Happy Hale
%          Tucker Killian
%          Grace Bushong
%          Rachael Mullin
%          Will Badart

% See git for version control.

clear;
clc;

realpass = input('What is the password: ', 's');
printGuesses = input('Print guesses? (0=no, 1=yes): ');

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

alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\|";:/?.>'',<ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜ¢£¥?ƒáíóúñÑªº¿¬½¼¡«»ßµ°·²';
guess = ' ';
counter = 0;

%% Crack Password

tic;
% checks password against the library
if counter <= 0
    for i = 1:size(password)
        counter = counter + 1;
        guess = password(i);
        if printGuesses
            disp(['Now testing: ', guess]);
        end
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
            
            % Test if password is ok
            if printGuesses
                fprintf('Now testing: %s\n', guess);
            end
            counter = counter + 1;
            if (strcmp(guess, realpass))
                break;
            end
        end % ends for index=1:combinationCount
        
        if (strcmp(guess, realpass))
            break;
        end
    end % ends for l=1:maxPassLength
end % ends if strcmp(guess, realpass) == 0


%% Display Results

disp(['Got it.  The password is "', guess, '."']);
if counter == 1
    disp(['It took ', num2str(counter), ' guess.']);
else
    disp(['It took ', num2str(counter), ' guesses.']);
end
toc;

