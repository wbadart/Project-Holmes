function [ ] = MessageDecoderRankFunc(handles, genBool)
% MessageDecoderRankFunc.m
% Decrypts a coded message uploaded into MATLAB using the ranking of
% frequency. 

% set parameters
message = handles.EncryptedText.String;
alphabet = 'abcdefghijklmnopqrstuvwxyz';
letterFreq = zeros(1, length(alphabet));
if genBool
    alphCommonI(1) = handles.AEdit.String;
    alphCommonI(2) = handles.BEdit.String;
    alphCommonI(3) = handles.CEdit.String;
    alphCommonI(4) = handles.DEdit.String;
    alphCommonI(5) = handles.EEdit.String;
    alphCommonI(6) = handles.FEdit.String;
    alphCommonI(7) = handles.GEdit.String;
    alphCommonI(8) = handles.HEdit.String;
    alphCommonI(9) = handles.IEdit.String;
    alphCommonI(10) = handles.JEdit.String;
    alphCommonI(11) = handles.KEdit.String;
    alphCommonI(12) = handles.LEdit.String;
    alphCommonI(13) = handles.MEdit.String;
    alphCommonI(14) = handles.NEdit.String;
    alphCommonI(15) = handles.OEdit.String;
    alphCommonI(16) = handles.PEdit.String;
    alphCommonI(17) = handles.QEdit.String;
    alphCommonI(18) = handles.REdit.String;
    alphCommonI(19) = handles.SEdit.String;
    alphCommonI(20) = handles.TEdit.String;
    alphCommonI(21) = handles.UEdit.String;
    alphCommonI(22) = handles.VEdit.String;
    alphCommonI(23) = handles.WEdit.String;
    alphCommonI(24) = handles.XEdit.String;
    alphCommonI(25) = handles.YEdit.String;
    alphCommonI(26) = handles.ZEdit.String;
end
alphCommon = 'etaoinshrdlcumwfgypbvkjxqz';


punctuationArray = ['(', ')', '.', '"', ' ,', '?', ':', '@', '#', '$', '%', '^', ...
    '&', '-', '_', ' ', ';', '!', ''''];

% put the message in the first row of dataCelss
for i = 1:length(message)
    dataCells{1, i} = lower(message(i));
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
        if ~genBool
            dataCells{3, p} = alphCommon(dataCells{2, p});
        else
            a = strfind(alphabet, dataCells{1, p});
            dataCells{3, p} = alphCommonI(a);
        end
    end
end
decodedM = lower(char(dataCells{3, 1:end})');

% re-build decryption scheme
for i = 1:length(alphabet)
    alphRank{3, i} = upper(alphCommon(alphRank{2, i}));
end

% update display
if ~genBool
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
end
handles.DecryptedMessage.String = decodedM;


end