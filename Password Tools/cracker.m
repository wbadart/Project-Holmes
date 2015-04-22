function [ results ] = cracker(realpass, timeout, alphabet, handles)
% cracker.m

% This program brute-force cracks a password.  What I'm thinking we can do
% initially is start small, so have like a 2 character password, and see
% what we can do to break that.  Once we have our cracking code on the
% page, then we can play around with the password, perhaps by increasing
% length or complexity, or having the program generate a password.

% Authors: Happy Hale
%          Tucker Killian
%          Grace Bushong
%          Rachael Mullin
%          Will Badart

% See git for version control.


%% Set Parameters

alphasize = size(alphabet);
guess = '';
counter = 0;

%% Crack Password
tic;
% check all 1 character passwords possible w/ given alphabet
if (~strcmp(guess, realpass) && toc < timeout)
    pause(0.001)
    handles.guesslength.String = '1';
    pause(0.001)
    for i = 1:alphasize(2)
        guess(1) = alphabet(i);
        counter = counter + 1;
        if (strcmp(guess, realpass) || toc >= timeout)
            break
        end
    end
end

% the password has more than one characters.  Check all possible 2
% character passwords
if (~strcmp(guess, realpass) && toc < timeout)
    pause(0.001)
    handles.guesslength.String = '2';
    pause(0.001)
    for i = 1:alphasize(2)
        counter = counter + 1;
        guess(1) = alphabet(i);
        for j = 1:alphasize(2)
            counter = counter + 1;
            guess(2) = alphabet(j);
            if (strcmp(guess, realpass) || toc >= timeout)
                break
            end
        end
        if (strcmp(guess, realpass) || toc >= timeout)
            break
        end
    end
end

% 3 character passwords
if (~strcmp(guess, realpass) && toc < timeout)
    pause(0.001)
    handles.guesslength.String = '3';
    pause(0.001)
    for i = 1:alphasize(2)
        counter = counter + 1;
        guess(1) = alphabet(i);
        for j = 1:alphasize(2)
            counter = counter + 1;
            guess(2) = alphabet(j);
            for k = 1:alphasize(2)
                counter = counter + 1;
                guess(3) = alphabet(k);
                if (strcmp(guess, realpass) || toc >= timeout)
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
end

% 4 character passwords
if (~strcmp(guess, realpass) && toc < timeout)
    pause(0.001)
    handles.guesslength.String = '4';
    pause(0.001)
    for i = 1:alphasize(2)
        counter = counter + 1;
        guess(1) = alphabet(i);
        for j = 1:alphasize(2)
            counter = counter + 1;
            guess(2) = alphabet(j);
            for k = 1:alphasize(2)
                counter = counter + 1;
                guess(3) = alphabet(k);
                for l = 1:alphasize(2)
                    counter = counter + 1;
                    guess(4) = alphabet(l);
                    if (strcmp(guess, realpass) || toc >= timeout)
                        break
                    end %ends if
                end %ends for(l)
                if (strcmp(guess, realpass) || toc >= timeout)
                    break
                end %ends if
            end %ends for(k)
            if (strcmp(guess, realpass) || toc >= timeout)
                break
            end %ends if
        end %ends for(j)
        if (strcmp(guess, realpass) || toc >= timeout)
            break
        end %ends if
    end %ends for(i)
end %ends if strcmp(guess, ...

% 5 character passwords
if (~strcmp(guess, realpass) && toc < timeout)
    pause(0.001)
    handles.guesslength.String = '5';
    pause(0.001)
    for i = 1:alphasize(2)
        counter = counter + 1;
        guess(1) = alphabet(i);
        for j = 1:alphasize(2)
            counter = counter + 1;
            guess(2) = alphabet(j);
            for k = 1:alphasize(2)
                counter = counter + 1;
                guess(3) = alphabet(k);
                for l = 1:alphasize(2)
                    counter = counter + 1;
                    guess(4) = alphabet(l);
                    for m = 1:alphasize(2);
                        counter = counter + 1;
                        guess(5) = alphabet(m);
                        if (strcmp(guess, realpass) || toc >= timeout)
                            break
                        end %ends if
                    end %ends for(m)
                    if (strcmp(guess, realpass) || toc >= timeout)
                        break
                    end %ends if
                end %ends for(l)
                if (strcmp(guess, realpass) || toc >= timeout)
                    break
                end %ends if
            end %ends for(k)
            if (strcmp(guess, realpass) || toc >= timeout)
                break
            end %ends if
        end %ends for(j)
        if (strcmp(guess, realpass) || toc >= timeout)
            break
        end %ends if
    end %ends for(i)
end %ends if strcmp(guess, ...

% 6 character passwords
if (~strcmp(guess, realpass) && toc < timeout)
    pause(0.001)
    handles.guesslength.String = '6';
    pause(0.001)
    for i = 1:alphasize(2)
        counter = counter + 1;
        guess(1) = alphabet(i);
        for j = 1:alphasize(2)
            counter = counter + 1;
            guess(2) = alphabet(j);
            for k = 1:alphasize(2)
                counter = counter + 1;
                guess(3) = alphabet(k);
                for l = 1:alphasize(2)
                    counter = counter + 1;
                    guess(4) = alphabet(l);
                    for m = 1:alphasize(2);
                        counter = counter + 1;
                        guess(5) = alphabet(m);
                        for n = 1:alphasize(2)
                            counter = counter + 1;
                            guess(6) = alphabet(n);
                            if (strcmp(guess, realpass) || toc >= timeout)
                                break
                            end %ends if
                        end %ends for(n)
                        if (strcmp(guess, realpass) || toc >= timeout)
                            break
                        end %ends if
                    end %ends for(m)
                    if (strcmp(guess, realpass) || toc >= timeout)
                        break
                    end %ends if
                end %ends for(l)
                if (strcmp(guess, realpass) || toc >= timeout)
                    break
                end %ends if
            end %ends for(k)
            if (strcmp(guess, realpass) || toc >= timeout)
                break
            end %ends if
        end %ends for(j)
        if (strcmp(guess, realpass) || toc >= timeout)
            break
        end %ends if
    end %ends for(i)
end %ends if strcmp(guess, ...

% 7 character passwords
if (~strcmp(guess, realpass) && toc < timeout)
    pause(0.001)
    handles.guesslength.String = '7';
    pause(0.001)
    for i = 1:alphasize(2)
        counter = counter + 1;
        guess(1) = alphabet(i);
        for j = 1:alphasize(2)
            counter = counter + 1;
            guess(2) = alphabet(j);
            for k = 1:alphasize(2)
                counter = counter + 1;
                guess(3) = alphabet(k);
                for l = 1:alphasize(2)
                    counter = counter + 1;
                    guess(4) = alphabet(l);
                    for m = 1:alphasize(2);
                        counter = counter + 1;
                        guess(5) = alphabet(m);
                        for n = 1:alphasize(2)
                            counter = counter + 1;
                            guess(6) = alphabet(n);
                            for o = 1:alphasize(2);
                                counter = counter + 1;
                                guess(7) = alphabet(o);
                                if (strcmp(guess, realpass) || toc >= timeout)
                                    break
                                end %ends if
                            end %ends for(o)
                            if (strcmp(guess, realpass) || toc >= timeout)
                                break
                            end %ends if
                        end %ends for(n)
                        if (strcmp(guess, realpass) || toc >= timeout)
                            break
                        end %ends if
                    end %ends for(m)
                    if (strcmp(guess, realpass) || toc >= timeout)
                        break
                    end %ends if
                end %ends for(l)
                if (strcmp(guess, realpass) || toc >= timeout)
                    break
                end %ends if
            end %ends for(k)
            if (strcmp(guess, realpass) || toc >= timeout)
                break
            end %ends if
        end %ends for(j)
        if (strcmp(guess, realpass) || toc >= timeout)
            break
        end %ends if
    end %ends for(i)
end %ends if strcmp(guess, ...

% 8 character passwords
if (~strcmp(guess, realpass) && toc < timeout)
    pause(0.001)
    handles.guesslength.String = '8';
    pause(0.001)
    for i = 1:alphasize(2)
        counter = counter + 1;
        guess(1) = alphabet(i);
        for j = 1:alphasize(2)
            counter = counter + 1;
            guess(2) = alphabet(j);
            for k = 1:alphasize(2)
                counter = counter + 1;
                guess(3) = alphabet(k);
                for l = 1:alphasize(2)
                    counter = counter + 1;
                    guess(4) = alphabet(l);
                    for m = 1:alphasize(2);
                        counter = counter + 1;
                        guess(5) = alphabet(m);
                        for n = 1:alphasize(2)
                            counter = counter + 1;
                            guess(6) = alphabet(n);
                            for o = 1:alphasize(2);
                                counter = counter + 1;
                                guess(7) = alphabet(o);
                                for p = 1:alphasize(2)
                                    counter = counter + 1;
                                    guess(8) = alphabet(p);
                                    if (strcmp(guess, realpass) || toc >= timeout)
                                        break
                                    end %ends if
                                end % ends for(p)
                                if (strcmp(guess, realpass) || toc >= timeout)
                                    break
                                end %ends if
                            end %ends for(o)
                            if (strcmp(guess, realpass) || toc >= timeout)
                                break
                            end %ends if
                        end %ends for(n)
                        if (strcmp(guess, realpass) || toc >= timeout)
                            break
                        end %ends if
                    end %ends for(m)
                    if (strcmp(guess, realpass) || toc >= timeout)
                        break
                    end %ends if
                end %ends for(l)
                if (strcmp(guess, realpass) || toc >= timeout)
                    break
                end %ends if
            end %ends for(k)
            if (strcmp(guess, realpass) || toc >= timeout)
                break
            end %ends if
        end %ends for(j)
        if (strcmp(guess, realpass) || toc >= timeout)
            break
        end %ends if
    end %ends for(i)
end %ends if strcmp(guess, ...
tElapsed = toc;

results.time = tElapsed;
results.guess = guess;
results.counter = counter;
results.found = 'brute force.';
