function [ guess ] = guessfunc( alphabet, passLength, guess, n, i )
 
% This is a function that relates passSlot to alphabet using passLength,
% realpass, and guess.  It outputs an array, guess.

alphasizeA = size(alphabet);
alphasize = alphasizeA(2);


for i = 1:alphasize
    guess(n) = alphabet(i);
end

% while (x <= passLength) && (strcmp(guess, realpass) == 0)
%     for i=2:passLength
%         n(i) = n + 1;
%     end
%     k = 1;
%     l = 1;
%     while (l <= alphasize) && (strcmp(guess, realpass) == 0)
%         guess(n(k)) = alphabet(l);
%         l = l + 1;
%     end
%     x = x + 1;
%     
%     
% end



end

