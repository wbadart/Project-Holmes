function [] = crackerFunc(handles)
% crackerFunc.m

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

realpass = handles.passwordIn.String;
alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\|";:/?.>'',<ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜ¢£¥?ƒáíóúñÑªº¿¬½¼¡«»ßµ°·²';
guess = ' ';
counter = 0;
if handles.guessbool.Value == 0
    handles.currentGuess.String = '';
end

%% Crack Password

tStart = tic;
% checks password against the library
if counter <= 0
    for i = 1:length(password)
        counter = counter + 1;
        guess = password(i);
        if handles.guessbool.Value == 1
            pause(0.00000001);
            handles.currentGuess.String = guess;
            %disp(['Now guessing: ', guess]);
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
            if handles.guessbool.Value == 1
                pause(0.00000000000000000001);
                handles.currentGuess.String = guess;
                %fprintf('Now testing: %s\n', guess);
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

tElapsed = toc(tStart);

%% Format Counter
% Based on int2str2.m by Olivier Ledoit

n = counter;
s = int2str(abs(n));
i = mod(-length(s),3);
s = [repmat('0',[1 i]) s];
j = length(s)/3;
s = reshape([reshape(s,[3 j]);repmat(',',[1 j])],[1 4*j]);
s([1:i 4*j]) = [];
s = [repmat('-',[1 n<0]) s];

%% Display Results

% switch counter
%     case 1
%         disp(['Got it.  The password is "', guess, '".'; ...
%             'It took ', s, ' guess.'; ...
%             'Total time: ', num2str(tElapsed)]);
%     otherwise
%         disp(['Got it.  The password is "', guess, '".']);
%         disp(['It took ', s, ' guesses.']);
%         disp(['Total time: ', num2str(tElapsed), ' sec.']);
% end

handles.passwordIn.Enable = 'inactive';
handles.passwordOut.String = guess;
handles.timeBox.String = [num2str(tElapsed), ' sec'];
handles.totalGuesses.String = s;

%% Evaluate Password Strength

if counter <= 10000
    switch str2double(s(end))
        case 1
            if counter > 10
                if str2double(s(end - 1)) == 1
                    handles.feedbackPanel.String = (['Your password is the ', s, 'th most common password.  Change it now.']);
                else
                    handles.feedbackPanel.String = (['Your password is the ', s, 'st most common password.  Change it now.']);
                end
            else
                handles.feedbackPanel.String = (['Your password is the ', s, 'st most common password.  Change it now.']);
            end
        case 2
            if counter > 10
                if str2double(s(end - 1)) == 1
                    handles.feedbackPanel.String = (['Your password is the ', s, 'th most common password.  Change it now.']);
                else
                    handles.feedbackPanel.String = (['Your password is the ', s, 'nd most common password.  Change it now.']);
                end
            else
                handles.feedbackPanel.String = (['Your password is the ', s, 'nd most common password.  Change it now.']);
            end
        case 3
            if counter > 10
                if str2double(s(end - 1)) == 1
                    handles.feedbackPanel.String = (['Your password is the ', s, 'th most common password.  Change it now.']);
                else
                    handles.feedbackPanel.String = (['Your password is the ', s, 'rd most common password.  Change it now.']);
                end
            else
                handles.feedbackPanel.String = (['Your password is the ', s, 'rd most common password.  Change it now.']);
            end
        otherwise
            handles.feedbackPanel.String = (['Your password is the ', s, 'th most common password.  Change it now.']);
    end
    
else
    chars.lowers.sym = 'abcdefghijklmnopqrstuvwxyz';
    chars.uppers.sym = upper(chars.lowers);
    chars.nums.sym = '1234567890';
    chars.spec.sym = '!@#$%^&*()-_=+[{]}\|;:''",<.>/?';
    
    chars.lowers.count = 0;
    chars.uppers.count = 0;
    chars.nums.count = 0;
    chars.spec.count = 0;
    
    for i = 1:length(guess)
        if ~isempty(strfind(chars.lowers.sym, guess(i)))
            chars.lowers.count = chars.lowers.count + 1;
        elseif ~isempty(strfind(chars.uppers.sym, guess(i)))
            chars.uppers.count = chars.uppers.count + 1;
        elseif ~isempty(strfind(chars.nums.sym, guess(i)))
            chars.nums.count = chars.nums.count + 1;
        elseif ~isempty(strfind(chars.spec.sym, guess(i)))
            chars.spec.count = chars.spec.count + 1;
        end 
    end
    
    if length(guess) < 3
        handles.feedbackPanel.String = 'The biggest problem is that your password is too short.  Add a few characters, shoot for at least 8.';
    elseif (chars.spec.count == 0) && (chars.nums.count == 0)
        handles.feedbackPanel.String = 'Your password doesn''t contain any numbers or special characters.  Add some for more security.';
    end
end

end