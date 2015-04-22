function [ ] = MessageDecoderRankFunc(handles)
% MessageDecoderRankFunc.m
% Decrypts a coded message uploaded into MATLAB using the ranking of
% frequency. 

% set parameters
message = handles.EncryptedText.String;
alphabet = 'abcdefghijklmnopqrstuvwxyz';
letterFreq = zeros(1, length(alphabet));
alphCommon = 'etaoinshrdlcumwfgybpvkjxqz';
punctuationArray = ['.', '"', ' ,', '?', ':', '@', '#', '$', '%', '^', ...
    '&', '-', '_', ' ', ';', '!', ''''];

% put the message in the first row of dataCelss
for i = 1:length(message)
    dataCells{1, i} = message(i);
    currentLetter = strfind(alphabet, message(i));
    letterFreq(currentLetter) = letterFreq(currentLetter) + 1;
end

%account for spaces & punctuation
for k = 1:length(message)
    if ischar(message(k))
        message(k) = lower(message(k));
    end
    for l = 1:length(punctuationArray)
        if strcmp(message(k), punctuationArray(l))
            dataCells{2,k} = -1;
            break
        end
    end
end

% rank letters
for j = 1:length(alphabet)
    alphRank{1, j} = alphabet(j);
    [m, a] = max(letterFreq);
    locations = strfind(message, alphabet(a));
    alphRank{2, a} = j;
    for i = 1:length(locations)
        dataCells{2, locations(i)} = j;
    end
    letterFreq(a) = 0;
end

% build decrypted message
for p = 1:length(message)
    if dataCells{2, p} == -1                % if punctuation
        dataCells{3, p} = dataCells{1, p};  % don't remap
    else
        dataCells{3, p} = alphCommon(dataCells{2, p});
    end
end
decodedM = char(dataCells{3, 1:end})';

% re-build decryption scheme
for i = 1:length(alphabet)
    alphRank{3, i} = upper(alphCommon(alphRank{2, i}));
end

% update display
handles.AEdit.String = alphRank{3,1};
handles.BEdit.String = alphRank{3,2};
handles.CEdit.String = alphRank{3,3};
handles.DEdit.String = alphRank{3,4};
handles.EEdit.String = alphRank{3,5};
handles.FEdit.String = alphRank{3,6};
handles.GEdit.String = alphRank{3,7};
handles.HEdit.String = alphRank{3,8};
handles.IEdit.String = alphRank{3,9};
handles.JEdit.String = alphRank{3,10};
handles.KEdit.String = alphRank{3,11};
handles.LEdit.String = alphRank{3,12};
handles.MEdit.String = alphRank{3,13};
handles.NEdit.String = alphRank{3,14};
handles.OEdit.String = alphRank{3,15};
handles.PEdit.String = alphRank{3,16};
handles.QEdit.String = alphRank{3,17};
handles.REdit.String = alphRank{3,18};
handles.SEdit.String = alphRank{3,19};
handles.TEdit.String = alphRank{3,20};
handles.UEdit.String = alphRank{3,21};
handles.VEdit.String = alphRank{3,22};
handles.WEdit.String = alphRank{3,23};
handles.XEdit.String = alphRank{3,24};
handles.YEdit.String = alphRank{3,25};
handles.ZEdit.String = alphRank{3,26};

handles.DecryptedMessage.String = decodedM;

end