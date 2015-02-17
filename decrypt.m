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

for i = 1:length(alphabetF)
    maxIndex = find(alphabetF == max(alphabetF));
    commonM(i).rank = i;
    commonM(i).letter = alphabet(maxIndex);
    alphabetF(maxIndex) = 0;
end

%% Assign message new letters based on rank

for i = 1:length(alphabet)
    jt = message(i);
    at = find(jt == commonM.letter);
end


