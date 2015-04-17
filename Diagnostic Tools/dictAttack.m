function [ results ] = dictAttack(realpass, timeout, dictionary, handles)

counter = 0;
pause(0.001);
handles.guesslength.String = 'dict attack';
pause(0.001);

tic;
for i = 1:length(dictionary)
    guess = dictionary(i);
    counter = counter + 1;
    if (strcmp(guess, realpass) || toc >= timeout)
        guess = guess{:};
        results.found = 'dictionary attack.';
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