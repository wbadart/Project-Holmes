function [ inStr ] = messageProc( inStr )

badChars = '.,?!@#$%^&*()_+=-"— ”“’/[]{}|\''';
i = 1;
while i <= length(inStr)
    if ~isempty(strfind(badChars, inStr(i)))
        inStr = [inStr(1:i-1), inStr(i+1:end)];
    end
    i = i + 1;
end

inStr = lower(inStr);

