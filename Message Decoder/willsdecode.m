message = messageProc(input('input message: ', 's'));
message = messageProc(message);

alphabet = 'abcdefghijklmnopqrstuvwxyz';
letterFreq = zeros(1, length(alphabet));
alphCommon = 'etaoinshrdlcumwfgybpvkjxqz';

for i = 1:length(message)
    dataCells{1, i} = message(i);
    currentLetter = strfind(alphabet, message(i));
    letterFreq(currentLetter) = letterFreq(currentLetter) + 1;
    
end

for j = 1:length(alphabet)
    [m, a] = max(letterFreq);
    locations = strfind(message, alphabet(a));
    for i = 1:length(locations)
        dataCells{2, locations(i)} = j;
    end
    letterFreq(a) = 0;
end

for p = 1:length(message)
    dataCells{3, p} = alphCommon(dataCells{2, p});
end

decodedM = char(dataCells{3, 1:end})';
disp(decodedM);