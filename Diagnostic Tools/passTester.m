function [ stat ] = passTester(realpass, N, timeout, alphabet, handles)
%Calculates the average time it takes to crack password "realpass" for
%   "N" trials.  Also passes a timout value to the crack function.  Returns
%   first the average time elapsed and an array containing the time elapsed
%   for each trial.

format short g

if alphabet == 4
    prompt = {'Input characters to test:'};
    alphabet = inputdlg(prompt);
    alphabet = char(alphabet);
else
    switch alphabet
        case 1
            alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*';
        case 2
            alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\|";:/?.>''';
        case 3
            alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\|";:/?.>'',<ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜ¢£¥?ƒáíóúñÑªº¿¬½¼¡«»ßµ°·²';
    end
end

t = zeros(1, N);
guesses = zeros(1, N);
for m = 1:N
    results = passCrackLFD(realpass, timeout, alphabet, handles);
    t(m) = results.time;
    guesses(m) = results.counter;
end

stat.allT = t;
stat.avgT = sum(t) / N;
stat.allC = guesses;
stat.avgC = sum(guesses) / N;
stat.avgPerSec = stat.avgC / stat.avgT;

bar(handles.timeAxis, t);
axis(handles.timeAxis, [0 N+1 0 max(t)+0.05]);
xlabel(handles.timeAxis, 'Run #');
ylabel(handles.timeAxis, 'Time (s)');
grid(handles.timeAxis);

bar(handles.speedAxis, stat.allC);
if min(stat.allC) < 8000
    axis([0 N+1 min(stat.allC)-1 max(stat.allC)+2]);
else
    axis([0 N+1 min(stat.allC)-8000 max(stat.allC)+1000]);
end
xlabel('Run #');
ylabel('Guesses');
grid on;

handles.guess.String = results.guess;

counter = guesses(end);
n = counter;
s = int2str(abs(n));
i = mod(-length(s),3);
s = [repmat('0',[1 i]) s];
j = length(s)/3;
s = reshape([reshape(s,[3 j]);repmat(',',[1 j])],[1 4*j]);
s([1:i 4*j]) = [];
s = [repmat('-',[1 n<0]) s];

if (counter <= 10000) && (handles.commonBool.Value)
    switch str2double(s(end))
        case 1
            if counter > 10
                if str2double(s(end - 1)) == 1
                    feedbackStr = (['Your password is the ', s, 'th most common password.  Change it now.']);
                else
                    feedbackStr = (['Your password is the ', s, 'st most common password.  Change it now.']);
                end
            else
                feedbackStr = (['Your password is the ', s, 'st most common password.  Change it now.']);
            end
        case 2
            if counter > 10
                if str2double(s(end - 1)) == 1
                    feedbackStr = (['Your password is the ', s, 'th most common password.  Change it now.']);
                else
                    feedbackStr = (['Your password is the ', s, 'nd most common password.  Change it now.']);
                end
            else
                feedbackStr = (['Your password is the ', s, 'nd most common password.  Change it now.']);
            end
        case 3
            if counter > 10
                if str2double(s(end - 1)) == 1
                    feedbackStr = (['Your password is the ', s, 'th most common password.  Change it now.']);
                else
                    feedbackStr = (['Your password is the ', s, 'rd most common password.  Change it now.']);
                end
            else
                feedbackStr = (['Your password is the ', s, 'rd most common password.  Change it now.']);
            end
        otherwise
            feedbackStr = (['Your password is the ', s, 'th most common password.  Change it now.']);
    end
    
else
    chars.lowers.sym = 'abcdefghijklmnopqrstuvwxyz';
    chars.uppers.sym = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    chars.nums.sym = '1234567890';
    chars.spec.sym = '!@#$%^&*()-_=+[{]}\|;:''",<.>/?';
    
    chars.lowers.count = 0;
    chars.uppers.count = 0;
    chars.nums.count = 0;
    chars.spec.count = 0;
    
    guess = realpass;
    for i = 1:length(guess)
        if ~isempty(strfind(chars.lowers.sym, guess(i)))
            chars.lowers.count = chars.lowers.count + 1;
        elseif ~isempty(strfind(chars.uppers.sym, guess(i)))
            chars.uppers.count = chars.uppers.count + 1;
        elseif ~isempty(strfind(chars.nums.sym, guess(i)))
            chars.nums.count = chars.nums.count + 1;
        elseif ~isempty(strfind(chars.spec.sym, guess(i)))
            chars.spec.count = chars.spec.count + 1;
        end 
    end
    
    if length(guess) < 3
        feedbackStr = 'The biggest problem is that your password is too short.  Add a few characters, shoot for at least 8.';
    elseif (chars.spec.count == 0) && (chars.nums.count == 0)
        feedbackStr = 'Your password doesn''t contain any numbers or special characters.  Add some for more security.';
    elseif (chars.spec.count == 0)
        feedbackStr = 'Your password doesn''t have any special characters.  Add a few for more security.';
    else
        feedbackStr = 'Thumbs up.';
    end
end

handles.feedback.String = feedbackStr;