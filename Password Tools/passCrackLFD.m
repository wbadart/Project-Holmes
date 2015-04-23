function [ results ] = passCrackLFD(realpass, timeout, alphabet, library, handles)

% passCrackLF.m (LITE, function, diagnostics version)

% This is the script passCrackLITE.m in function form.  This allows it to
% be called by passTester.m.  Interesting note: other than the script vs.
% function format, the code is identical, yet this file cracks passwords
% roughly 3x faster.

% Author:       Will Badart
%               See git for version control

%% Set Parameters

guess = '';
counter = 0;
found = false;
dictionary = library.dictionary;
common = library.common;
nums = '0123456789';

%% Crack Password
tic;

if handles.commonBool.Value
    pause(0.001);
    handles.guesslength.String = 'common check';
    pause(0.001);
    for i = 1:length(common)
        guess = common(i);
        counter = counter + 1;
        if (strcmp(guess, realpass) || toc >= timeout)
            guess = guess{:};
            found = true;
            results.found = 'common password attack.';
            break
        end
    end
end

if ((handles.dictBool.Value) && (~strcmp(guess, realpass)))
    pause(0.001);
    handles.guesslength.String = 'dict attack';
    pause(0.001);
    for i = 1:length(dictionary)
        guess = dictionary(i);
        counter = counter + 1;
        if (strcmp(guess, realpass) || toc >= timeout)
            guess = guess{:};
            found = true;
            results.found = 'dictionary attack.';
            break
        end
    end
end

if ((handles.modDictBool.Value) && ~strcmp(guess, realpass))
    pause(0.001);
    handles.guesslength.String = 'mod dict';
    pause(0.001);
    for i = 1:length(dictionary)
        for j = 1:length(nums)
            for k = 1:length(nums)
                guess = cell2mat([dictionary(i), nums(j), nums(k)]);
                counter = counter + 1;
                if (strcmp(guess, realpass) || toc >= timeout)
                    found = true;
                    results.found = 'modified dictionary attack.';
                    break
                end
            end
            if (strcmp(guess, realpass) || toc >= timeout)
                break
            end
        end
        if (strcmp(guess, realpass) || toc >=timeout)
            break
        end
    end
end


if ~strcmp(guess, realpass)
maxPassLength = 8; %input('Max length of password to check: ');
for l = 1:maxPassLength,
    
    pause(0.001);
    handles.guesslength.String = num2str(l);
    pause(0.001);
    
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
if ~((handles.commonBool.Value || handles.dictBool.Value || handles.modDictBool.Value))
    counter = length(alphabet) ^ l + index; %brute force guesses only
    results.found = 'brute force.';
else
    if ~found
        counter = counter + length(alphabet) ^ l + index;
        results.found = 'brute force.';
    end
end

results.time = tElapsed;
results.guess = guess;
results.counter = counter;

end