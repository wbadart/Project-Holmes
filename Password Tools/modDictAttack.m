function [ results ] = modDictAttack(realpass, timeout, dictionary, handles)

pause(0.001);
handles.guesslength.String = 'mod dict';
pause(0.001);
nums = '0123456789';
counter = 0;
tic;

for i = 1:length(dictionary)
    for j = 1:length(nums)
        for k = 1:length(nums)
            guess = cell2mat([dictionary(i), nums(j), nums(k)]);
            counter = counter + 1;
            if (strcmp(guess, realpass) || toc >= timeout)
                results.found = 'modified dictionary attack.';
                break
            end
        end
        if (strcmp(guess, realpass) || toc >= timeout)
            break
        end
    end
    if (strcmp(guess, realpass) || toc >= timeout)
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