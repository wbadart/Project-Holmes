function [ stat ] = passTester(realpass, N, timeout, alphabet, handles)
%Calculates the average time it takes to crack password "realpass" for
%   "N" trials.  Also passes a timout value to the crack function.  Returns
%   first the average time elapsed and an array containing the time elapsed
%   for each trial, and gives feedback based on the password's strength.

format short g

chars.lowers.sym = 'abcdefghijklmnopqrstuvwxyz';
chars.uppers.sym = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
chars.nums.sym = '1234567890';
chars.spec.sym = '!@#$%^&*()-_=+[{]}\|;:''",<.>/?';
chars.foreign.sym = '������������������������ܢ��?���������';

if alphabet == 5
    prompt = {'Input characters to test:'};
    alphabet = inputdlg(prompt);
    alphabet = char(alphabet);
else
    switch alphabet
        case 1
            alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*';
        case 2
            alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\|";:/?.>''';
        case 3
            alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\|";:/?.>'',<��������������������������ܢ��?������Ѫ��������ߵ���';
        case 4
            alphabet = '';
            if handles.lowerBool.Value
                alphabet = [alphabet, chars.lowers.sym];
            end
            if handles.upperBool.Value
                alphabet = [alphabet, chars.uppers.sym];
            end
            if handles.numBool.Value
                alphabet = [alphabet, chars.nums.sym];
            end
            if handles.specBool.Value
                alphabet = [alphabet, chars.spec.sym];
            end
            if handles.foreignBool.Value
                alphabet = [alphabet, chars.foreign,sym];
            end
    end
end

filename = 'dictionary.txt';
delimiter = '';
formatSpec = '%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
dictionary = dataArray{:, 1};
clearvars filename delimiter formatSpec fileID dataArray ans;

filename = 'commonPass.txt';
delimiter = '';
formatSpec = '%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
common = dataArray{:, 1};
clearvars filename delimiter formatSpec fileID dataArray ans;

library.common = common;
library.dictionary = dictionary;

t = zeros(1, N);
guesses = zeros(1, N);
if handles.lfdBool.Value
    for m = 1:N
        results = passCrackLFD(realpass, timeout, alphabet, library, handles);
        t(m) = results.time;
        guesses(m) = results.counter;
    end
elseif handles.crackerBool.Value
    for m = 1:N
        results = cracker(realpass, timeout, alphabet, handles);
        t(m) = results.time;
        guesses(m) = results.counter;
    end
elseif handles.modularBool.Value
    for m = 1:N
        results.isfound = false;
        if handles.commonBool.Value
            results = commonPass(realpass, timeout, library.common, handles);
            t(m) = results.time;
            guesses(m) = results.counter;
        end
        if (handles.dictBool.Value && ~results.isfound)
            results = dictAttack(realpass, timeout, library.dictionary, handles);
            t(m) = results.time;
            guesses(m) = results.counter;
        end
        if (handles.modDictBool.Value && ~results.isfound)
            results = modDictAttack(realpass, timeout, library.dictionary, handles);
            t(m) = results.time;
            guesses(m) = results.counter;
        end
        if results.isfound == false
            results = cracker(realpass, timeout, alphabet, handles);
            t(m) = results.time;
            guesses(m) = results.counter;
        end
    end
end


stat.allT = t;
stat.avgT = sum(t) / N;
stat.allC = guesses;
stat.avgC = sum(guesses) / N;
stat.avgPerSec = stat.avgC / stat.avgT;

bar(handles.timeAxis, t);
axis(handles.timeAxis, [0 N+1 0 max(t)+0.05]);
xlabel(handles.timeAxis, 'Run #');
ylabel(handles.timeAxis, 'Time (s)');
grid(handles.timeAxis);

bar(handles.speedAxis, stat.allC);
if min(stat.allC) < 8000
    axis([0 N+1 min(stat.allC)-1 max(stat.allC)+2]);
else
    axis([0 N+1 min(stat.allC)-8000 max(stat.allC)+1000]);
end
xlabel('Run #');
ylabel('Guesses');
grid on;

handles.guess.String = results.guess;

counter = guesses(end);
n = counter;
s = int2str(abs(n));
i = mod(-length(s),3);
s = [repmat('0',[1 i]) s];
j = length(s)/3;
s = reshape([reshape(s,[3 j]);repmat(',',[1 j])],[1 4*j]);
s([1:i 4*j]) = [];
s = [repmat('-',[1 n<0]) s];

%% Give Feedback
if (counter <= 10000) && (handles.commonBool.Value)
    switch str2double(s(end))
        case 1
            if counter > 10
                if str2double(s(end - 1)) == 1
                    feedbackStr = (['Your password is the ', s, 'th most common password.  Change it now.']);
                else
                    feedbackStr = (['Your password is the ', s, 'st most common password.  Change it now.']);
                end
            else
                feedbackStr = (['Your password is the ', s, 'st most common password.  Change it now.']);
            end
        case 2
            if counter > 10
                if str2double(s(end - 1)) == 1
                    feedbackStr = (['Your password is the ', s, 'th most common password.  Change it now.']);
                else
                    feedbackStr = (['Your password is the ', s, 'nd most common password.  Change it now.']);
                end
            else
                feedbackStr = (['Your password is the ', s, 'nd most common password.  Change it now.']);
            end
        case 3
            if counter > 10
                if str2double(s(end - 1)) == 1
                    feedbackStr = (['Your password is the ', s, 'th most common password.  Change it now.']);
                else
                    feedbackStr = (['Your password is the ', s, 'rd most common password.  Change it now.']);
                end
            else
                feedbackStr = (['Your password is the ', s, 'rd most common password.  Change it now.']);
            end
        otherwise
            feedbackStr = (['Your password is the ', s, 'th most common password.  Change it now.']);
    end
    
else
    
    % Evaluate password contents
    chars.lowers.count = 0;
    chars.uppers.count = 0;
    chars.nums.count = 0;
    chars.spec.count = 0;
    
    guess = realpass;
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
    
    inDict = false;
    for i = 1:length(dictionary)
        if ~isempty(strfind(guess, char(dictionary(i))))
            inDict = true;
        end
    end
    
    
    % Construct feedback
    feedbackStr='';
    if length(guess) < 8
        if ~isempty(feedbackStr)
            feedbackStr = [feedbackStr, '  Longer passwords are more difficult to crack.  Add characters for a total greater than 8.'];
        else
            feedbackStr = [feedbackStr, 'Longer passwords are more difficult to crack.  Add characters for a total greater than 8.'];
        end
    end
    if (chars.spec.count == 0)
        if ~isempty(feedbackStr)
            feedbackStr = [feedbackStr, '  Add symbols to increase the security of your password.'];
        else
            feedbackStr = [feedbackStr, 'Add symbols to increase the security of your password.'];
        end
    end
    if (chars.nums.count==0)
        if ~isempty(feedbackStr)
            feedbackStr = [feedbackStr, '  Add numbers to increase the security of your password.'];
        else
            feedbackStr=[feedbackStr, 'Add numbers to increase the security of your password.'];
        end
    end
    if (chars.spec.count==length(guess))
        if ~isempty(feedbackStr)
            feedbackStr = [feedbackStr, '  Add letters to increase the security of your password.'];
        else
            feedbackStr= [feedbackStr, 'Add letters to increase the security of your password.'];
        end
    end
    if(chars.uppers.count==0)
        if ~isempty(feedbackStr)
            feedbackStr=[feedbackStr, '  Add uppercase letters to increase the security of your password.'];
        else
            feedbackStr=[feedbackStr, 'Add uppercase letters to increase the security of your password.'];
        end
    end
    if(chars.lowers.count==0)
        if ~isempty(feedbackStr)
            feedbackStr=[feedbackStr, '  Add lowercase letters to increase the security of your password.'];
        else
            feedbackStr=[feedbackStr, 'Add lowercase letters to increase the security of your password.'];
        end
    end
    if inDict
        if ~isempty(feedbackStr)
            feedbackStr = [feedbackStr, '  Part or all of your password was found in the dictionary.'];
        else
            feedbackStr = [feedbackStr, 'Part or all of your password was found in the dictionary.'];
        end
    end
    minTime = timeout - 0.1;
    maxTime = timeout + 0.1;
    if ((stat.avgT >= minTime) && (stat.avgT <= maxTime))
        if ~isempty(feedbackStr)
            feedbackStr = [feedbackStr, '  Timeout.'];
        else
            feedbackStr = [feedbackStr, 'Timeout.'];
        end
    else
        if ~isempty(feedbackStr)
            feedbackStr = [feedbackStr, '  Broken via ', results.found];
        else
            feedbackStr = [feedbackStr, 'Broken via ', results.found];
        end
    end
    
    if isempty(feedbackStr)
        feedbackStr = [feedbackStr, 'Thumbs up.'];
    end
end
handles.feedback.String = feedbackStr;
end

