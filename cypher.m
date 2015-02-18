% cypher.m

% Encodes strings using the Caesar cypher method.  Creates nice encrypted
% messages to be tested by decrypt.m.

% Author:       Will Badart
%               See git for version control.

clear;
clc;

%% Set Parameters

message = lower(input('Message to be encrypted: ', 's'));
alphabet = 'abcdefghijklmnopqrstuvwxyz';

%% Encode

for n = 1:10
    m = 1;
    while m <= length(message);
        if ismember(message(m), alphabet) == 0
            message(m) = '';
        end
        m = m + 1;
    end
end

% convert each char of message to index in alphabet
for i = 1:length(message)
    messageNum(i) = strfind(alphabet, message(i));
end

% shifts index array by 5
for j = 1:length(message)
    messageNumM(j) = messageNum(j) + 5;
    if messageNumM(j) > 26
        messageNumM(j) = messageNumM(j) - 26;
    end
end

for k = 1:length(message)
    messageM(k) = alphabet(messageNumM(k));
end

%% Print Result

disp(['Your encoded message is: ', messageM]);