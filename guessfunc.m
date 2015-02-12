function [ guess ] = guessfunc( alphabet, passLength, passSlot, realpass, guess, icount )
 
% This is a function that relates passSlot to alphabet using passLength,
% realpass, and guess.  It outputs an array, guess.


guess(1:end) = alphabet(icount);
x = 1;
alphasizeA = size(alphabet);
alphasize = alphasizeA(2);

while (x <= passLength) && (strcmp(guess, realpass) == 0)
    k = 1;
    l = 1;
    while (l <= alphasize) && (strcmp(guess, realpass) == 0)
        guess(passSlot(k)) = alphabet(l);
        l = l + 1;
    end
    x = x + 1;
    
    
end



end

