% cracker.m

% This program brute-force cracks a password.  What I'm thinking we can do
% initially is start small, so have like a 2 character password, and see
% what we can do to break that.  Once we have our cracking code on the
% page, then we can play around with the password, perhaps by increasing
% length or complexity, or having the program generate a password.

% Authors: Happy Hale
%          Tucker (?)
%          Grace Bushong
%          Rachael (?)
%          Will Badart

% See git for version control.

clear;
clc;

realpass = input('What is the password: ', 's');

%% Password is a number

if isa(realpass, 'double');
    guess = 0;
    counter = 0;
    
    while realpass ~= guess
        guess = guess + 1;
        counter = counter + 1;
    end
    
    disp(['Got it.  The password is ', num2str(guess)]);
    disp(['It took ', num2str(counter), ' guesses.']);
    
    
    % Password is a word
    
elseif isa(realpass, 'char');
    alphabet = 'abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+[{]}\|";:/?.>,<';
    alphasize = size(alphabet);
    guess = ' ';
    counter = 0;
    i = 0;
    j = 0;
    
    while strcmp(guess, realpass) == 0
        
        
        for i = 1:alphasize(2)
            guess(1) = alphabet(i);
            counter = counter + 1;
            if strcmp(guess, realpass) == 1
                break
            end
        end
        
        if strcmp(guess, realpass) == 0
            for i = 1:alphasize(2)
                counter = counter + 1;
                guess(1) = alphabet(i);
                for j = 1:alphasize(2)
                    counter = counter + 1;
                    guess(2) = alphabet(j);
                    if strcmp(guess, realpass) == 1
                        break
                    end
                end
                if strcmp(guess, realpass) == 1
                    break
                end
            end
        end
        
        if strcmp(guess, realpass) == 0
            for i = 1:alphasize(2)
                counter = counter + 1;
                guess(1) = alphabet(i);
                for j = 1:alphasize(2)
                    counter = counter + 1;
                    guess(2) = alphabet(j);
                    for k = 1:alphasize(2)
                        counter = counter + 1;
                        guess(3) = alphabet(k);
                        if strcmp(guess, realpass) == 1
                            break
                        end
                    end
                    if strcmp(guess, realpass) == 1
                        break
                    end
                end
                if strcmp(guess, realpass) == 1
                    break
                end
            end
        end
        
        if strcmp(guess, realpass) == 0
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
                            if strcmp(guess, realpass) == 1
                                break
                            end
                        end
                        if strcmp(guess, realpass) == 1
                            break
                        end
                    end
                    if strcmp(guess, realpass) == 1
                        break
                    end
                end
                if strcmp(guess, realpass) == 1
                    break
                end
            end
        end

%         i = i + 1;
%         for k = 1:i;
%             for j = 1:alphasize(2)
%                 guess(i) = alphabet(j);
%                 if strcmp(guess, realpass) == 1
%                     break;
%                 end
%             end
%         end
  
        
%         for n = 1:8
%             for i = 1:alphasize(2)
%                 guess(n) = alphabet(i);
%                 if strcmp(guess, realpass) == 1
%                     break;
%                 end
%             end
%             if strcmp(guess, realpass) == 1
%                 break;
%             end
%         end
        
        
%         i = i + 1;
%         
%         %if i <= alphasize(2)
%         %    guess(1) = alphabet(i);
%         %    
%         %else
%             
%             while strcmp(guess, realpass) == 0
%                 j = j +1;
%                 guess(1) = alphabet(j);
%                 
%                 for k = 1:alphasize(2);
%                     guess(2) = alphabet(k);
%                     if strcmp(guess, realpass) == 1
%                         break;
%                     end
%                 end
%             end            
%        end

    end
    
    disp(['Got it.  The password is ', guess]);
    disp(['It took ', num2str(counter), ' guesses.']);
    
end
