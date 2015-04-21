function [ C ] = dictCombine(orig, addition, name, handles)
% Merges two dictionary text files into one.

% Import Text Files

name = [name, '.txt'];

filename = orig;
delimiter = '';
formatSpec = '%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
orig = dataArray{:, 1};
clearvars filename delimiter formatSpec fileID dataArray ans;

filename = addition;
delimiter = '';
formatSpec = '%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
addition = dataArray{:, 1};
clearvars filename delimiter formatSpec fileID dataArray ans;

% Set Parameters
h = waitbar(0,'Please wait...');
letter = 'a';
indexRange = [0, 0];
isFirstPass = true;
tic;

% Set base as larger dictionary
if length(addition) > length(orig)
    orig_prime = orig;
    orig = addition;
    addition = orig_prime;
end
newDict = orig;

for i = 1:length(addition)
    word = addition(i);     % covert current selection to char
    word = word{:};
    
    if strcmp(letter, lower(word(1)))
        nextLetter = false;
    else
        nextLetter = true;
        letter = word(1);
    end
    
    [overlap, indexRange] = hasOverlap(orig, word, nextLetter, indexRange, isFirstPass);
    
    if overlap
        newDict(end + 1) = addition(i);
    end
    
    isFirstPass = false;    % hasOverlap no longer needs to regenerate range every time
    
    % Write to text file
    if ~mod(i, str2double(handles.iterText.String))
        C = sort(newDict.');
        fid = fopen(name, 'wt');
        fprintf(fid, '%s\n', C{:});
        fclose(fid);
        waitbar(i / length(addition));
        toc;
        disp(['Last checked word is: ', word]);
    end
    
end

close(h);

end