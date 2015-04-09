function [ stat ] = passTester(realpass, N, timeout, alphabet)
%Calculates the average time it takes to crack password "realpass" for
%   "N" trials.  Also passes a timout value to the crack function.  Returns
%   first the average time elapsed and an array containing the time elapsed
%   for each trial.

format short g

t = zeros(1, N);
guesses = zeros(1, N);
for m = 1:N
    results = passCrackLFD(realpass, timeout, alphabet);
    t(m) = results.time;
    guesses(m) = results.counter;
end

stat.allT = t;
bar(t);
stat.avgT = sum(t) / N;

stat.allC = guesses;
stat.avgC = sum(guesses) / N;
stat.avgPerSec = stat.avgC / stat.avgT;