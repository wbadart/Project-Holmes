function [ avgT, allT ] = passTester(realpass, N, timeout)
%Calculates the average time it takes to crack password "realpass" for
%   "N" trials.  Also passes a timout value to the crack function.  Returns
%   first the average time elapsed and an array containing the time elapsed
%   for each trial.

t = zeros(1, N);
for i = 1:N
    t(i) = passCrackLF(realpass, timeout);
end

allT = t;
avgT = sum(t) / N;