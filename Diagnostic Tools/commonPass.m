function [ results ] = commonPass(realpass, timeout, common, handles)

pause(0.001);
handles.guesslength.String = 'common check';
pause(0.001);
counter = 0;
tic;
for i = 1:length(common)
    guess = common(i);
    counter = counter + 1;
    if (strcmp(guess, realpass) || toc >= timeout)
        guess = guess{:};
        results.found = 'common password attack.';
        break
    end
end
tElapsed = toc;

results.time = tElapsed;
results.guess = guess;
results.counter = counter;
results.isfound = false;
if strcmp(guess, realpass)
    results.isfound = true;
end

end