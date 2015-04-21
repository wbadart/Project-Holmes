message = messageProc(input('input message: ', 's'));
message = messageProc(message);
disp(message);
alphabet = 'abcdefghijklmnopqrstuvwxyz';


for i = 1:length(message)
    letterIndex = strfind(alphabet, message(i));
    letterIndex = mod(letterIndex + 1, 26);
    if ~letterIndex
        letterIndex = letterIndex + 1;
    end
    message(i) = alphabet(letterIndex);
end
disp(message);