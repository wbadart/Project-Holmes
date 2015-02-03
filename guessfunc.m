function [ guess ] = guessfunc( alphabet, passLength, passSlot, realpass, guess )
 
% This is a function that relates passSlot to alphabet using passLength,
% realpass, and guess.  It outputs an array, guess.


%guess(1:end) = 'a';
k = 1;
alphasizeA = size(alphabet);
alphasize = alphasizeA(2);

while (k <= passLength) && (strcmp(guess, realpass) == 0)
    
    l = 1;
    while (l <= alphasize) && (strcmp(guess, realpass) == 0)
        guess(passSlot(k)) = alphabet(l);
        l = l + 1;
    end
    k = k + 1;
    
end



end

