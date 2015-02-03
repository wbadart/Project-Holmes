function [ guess ] = guessfunc( alphabet, passLength, passSlot, realpass, guess )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


guess(1:end) = 'a';
k = 1;
alphasizeA = size(alphabet);
alphasize = alphasizeA(2);

while (k <= passLength) && (strcmp(guess, realpass) == 0)
    
    l = 1;
    while (l <= alphasize) && (strcmp(guess, realpass) == 0)
        guess(passSlot(k)) = alphabet(l);
        l = l + 1;
    end
    guess(passSlot(k)) = alphabet(1);
    k = k + 1;
    
end



end

