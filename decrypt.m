% decrypt.m

% Takes a message encrypted using the Vigenère cipher method and cracks it by
% finding the most commonly occuring characters and mapping them to the
% most commonly occuring characters in English.

% Author:       Will Badart
% Last Edited:  2/17/15

clear;
clc;

%% Set Parameters

message = input('Encrypted message: ', 's');
alphabet = 'abcdefghijklmnopqrstuvwxyz';
commonLetters = 'etaoinshrdlcumwfgypbvkjxqz';
for i = 1:length(commonLetters)
    common(i).rank = i;
    common(i).letter = commonLetters(i);
end

%% Find frequency letters in message

alphabetF = zeros(1, length(alphabet));

for i = 1:length(message)
    jt = message(i); %jt is the current letter in the message
    at = find(alphabet == jt); % at is the index of the current letter
    alphabetF(at) = alphabetF(at) + 1; %increments frequency counter
end

%% Rank message letters based on frequency

for k = 1:length(alphabetF)
    maxIndex = find(alphabetF == max(alphabetF));
    commonM(k).rank = k;
    commonM(k).letter = alphabet(maxIndex);
    alphabetF(maxIndex) = 0;
end

%% Assign message new letters based on rank

% %remove ties in frequency
% for j = 1:length(alphabet)
%     if length(commonM(j).letter) > 1
%         commonM(j + 1).letter = commonM(j).letter(2:end);
%         commonM(j).letter = commonM(j).letter(1);
%     end
% end

%removes unneeded elements of commonM
o = 1;
while length(commonM(o).letter) ~= 26
    lineup(o).value = commonM(o).letter;
    o = o + 1;
end

%arranges letters of message according to frequency
for p = 1:length(lineup)
    for q = 1:length(lineup(p).value)
        lineupM(p) = lineup(p).value(q);
    end
end

%adds field letterNew to commonM structure
for m = 1:length(alphabet)
    commonM(m).letterNew = common(m).letter;
end

%maps new letters to message according to frequency
for r = 1:length(lineupM)
    index = strfind(message, lineupM(r));
    message(index) = commonM(r).letterNew;
end


