%% MessageDecoderRankFunc.m
% Decrypts a coded message uploaded into MATLAB using the ranking of
% frequency. 


function MessageDecoderRankFunc(handles)
%% Upload Image

% fileName = handles.BrowseText.String;
% 
% Mimage = imread(fileName);


%% Stores Message

message = handles.EncryptedText.String;

messageLength = length(message);

alphabetF{3, messageLength} = zeros;

%stores each character in the first row of the cell
for u = 1:messageLength
    
    alphabetF{1, u} = message(u);
end

%% Set Parameters

%Creates an array arranging letters according to frequency largest to
%smallest
letterRankArray = ['e', 't', 'a', 'o', 'i', 'n', 's', 'h', 'r', 'd', 'l', ...
    'c', 'u', 'm', 'w', 'f', 'g', 'y', 'b', 'p', 'v', 'k', 'j', 'x', ...
    'q', 'z'];


punctuationArray = ['.', '"', ' ,', '?', ':', '@', '#', '$', '%', '^', ...
    '&', '-', '_', ' ', ';'];

letter = 0; %initializes number of time a character appears

letterFreq = 0; %initializes letter frequency

letterFreqArray = zeros(1, messageLength);

sorted = false;

spaceNum = 0;

messageDecrypted = blanks(messageLength); %creates an empty string of message length
%% Frequency
%removes spaces & punctuation
for k = 1:messageLength
    for l = 1:length(punctuationArray)
        
        if strcmp(message(k), punctuationArray(l))
            alphabetF{2,k} = -1;
            spaceNum = spaceNum + 1;
        end
        
        
    end
end

%Stores the frequency of each symbol in the second row of the cell
for u = 1:messageLength - spaceNum
    
    %skips spaces & punctuation
    for v = 1:length(punctuationArray)
        if strcmp(message(u), punctuationArray(v))
            u = u + 1;
        end
    end
    for v = 1:messageLength-1
        
        %finds characters that match and counts how many there are
        if strcmp(message(u),message(v+1))
            
            letter = letter + 1;
        else
        end
        
    end
    %calculates frequency of the character
    letterFreq = letter/(messageLength - spaceNum);
    
    %stores the frequency of the letter
    letterFreqArray(u) = letterFreq;
    
    alphabetF{2 , u} = letterFreqArray(u);
    
    %restarts the count
    letterFreq = 0;
    letter = 0;
end
%% Sort
%restrict number of characters so that letters will only have one frequency
%Tl;dr Removing repeat characters
for u = 1:messageLength
    for v = u:messageLength-u
        if message(u) == message(v+1)
            
            alphabetF{1, v+1} = ' ';
            alphabetF{2, v+1} = -1;
            
        end
    end
end

%Sorts the frequencys in alphabetF largest to smallest (second row of cell
while ~sorted
    
    y = 5;
    
    for u = 1:messageLength - 1
        if  alphabetF{2, u} < alphabetF{2, u+1}
            
            larger = alphabetF{2, u+1};
            smaller = alphabetF{2, u};
            
            largerLetter = alphabetF{1, u+1};
            smallerLetter = alphabetF{1, u};
            
            alphabetF{2, u} = larger;
            alphabetF{2, u+1} = smaller;
            
            alphabetF{1, u} = largerLetter;
            alphabetF{1, u+1} = smallerLetter;
            
            y = y - 1;
        elseif strcmp(alphabetF{1,u}, ' ');
            
            larger = alphabetF{2, u+1};
            smaller = alphabetF{2, u};
            
            largerLetter = alphabetF{1, u+1};
            smallerLetter = alphabetF{1, u};
            
            alphabetF{2, u} = larger;
            alphabetF{2, u+1} = smaller;
            
            alphabetF{1, u} = largerLetter;
            alphabetF{1, u+1} = smallerLetter;
            
        end
    end
    if y == 5 && u == messageLength - 1
        
        sorted = true;
    end
    
end


%% Match
%matches frequencies to letter
for v = 1:26
   if alphabetF{2,v} >= 0
    alphabetF{3, v} = letterRankArray(v);
   else
   end
end

%matches punctuation
for u = 27:messageLength
    for v = 1: length(punctuationArray)
        if strcmp(alphabetF{1,u},punctuationArray(v))
            
            alphabetF{3,u} = punctuationArray(v);
            
        end
    end
end


%% Decrypts message

%creates a new array of the now decrypted message
for u = 1:messageLength
    for v = 1:26
        
        if strcmp(message(u), alphabetF{1,v})
            
            messageDecrypted(u) = alphabetF{3,v};
      
        end
    end
     for v = 1:length(punctuationArray)
        
        if strcmp(message(u), punctuationArray(v))
            
            messageDecrypted(u) = punctuationArray(v);
            
        end
    end
end

%% Display possible letters

handles.AEdit.String = alphabetF{1,3};
handles.BEdit.String = alphabetF{1,19};
handles.CEdit.String = alphabetF{1,12};
handles.DEdit.String = alphabetF{1,10};
handles.EEdit.String = alphabetF{1,1};
handles.FEdit.String = alphabetF{1,16};
handles.GEdit.String = alphabetF{1,17};
handles.HEdit.String = alphabetF{1,8};
handles.IEdit.String = alphabetF{1,5};
handles.JEdit.String = alphabetF{1,23};
handles.KEdit.String = alphabetF{1,22};
handles.LEdit.String = alphabetF{1,11};
handles.MEdit.String = alphabetF{1,14};
handles.NEdit.String = alphabetF{1,6};
handles.OEdit.String = alphabetF{1,4};
handles.PEdit.String = alphabetF{1,20};
handles.QEdit.String = alphabetF{1,25};
handles.REdit.String = alphabetF{1,9};
handles.SEdit.String = alphabetF{1,7};
handles.TEdit.String = alphabetF{1,2};
handles.UEdit.String = alphabetF{1,13};
handles.VEdit.String = alphabetF{1,21};
handles.WEdit.String = alphabetF{1,15};
handles.XEdit.String = alphabetF{1,24};
handles.YEdit.String = alphabetF{1,18};
handles.ZEdit.String = alphabetF{1,16};

%% Display Decrypted Letter

handles.DecryptedMessage.String = messageDecrypted;

