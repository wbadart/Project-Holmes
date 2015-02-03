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

clear;
clc;

realpass = input('What is the password: ', 's');

%% Import Password Library

filename = 'commonPass.txt';
delimiter = '';
formatSpec = '%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
password = dataArray{:, 1};
clearvars filename delimiter formatSpec fileID dataArray ans;

%% Set Parameters

alphabet = 'abcd';
%efghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\|";:/?.>'',<ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜ¢£¥?ƒáíóúñÑªº¿¬½¼¡«»ßµ°·²
alphasizeA = size(alphabet);
alphasize = alphasizeA(2);

guess = ' ';
counter = 0;
%i = 0;
%j = 0;

%% Crack Password

% checks password against the library
for i = 1:size(password)
    counter = counter + 1;
    guess = password(i);
    if strcmp(guess, realpass) == 1
        guess = guess{:};
        break
    end
end

% if password isn't found in library:
if strcmp(guess, realpass) == 0
    passLength = 1;
    passSlotA = (1:passLength);
    passSlot = passSlotA(end:-1:1);
    icount = 0;
    guess = ' '; % reset 'guess.'  It wasn't a common password
    guess(1:passLength) = 'a';
    while strcmp(guess, realpass) == 0
        icount = icount + 1;
        if guess(1:end) == alphabet(end)
            guess(1:end) = 'a';
            passLength = passLength + 1;
            passSlotA = (i:passLength);
            passSlot = passSlotA(end:-1:1);
        end
        
        for i = 1:passLength
            for j = 1:alphasize
                
                guess(passSlot(i)) = alphabet(j);
                
                
                
                if strcmp(guess, realpass) == 1
                    break;
                end
                
                
                
            end
            
            if strcmp(guess, realpass) == 1
                break;
            end
            
            
            
        end
        
        
        
        
%         if b > alphasize
%             passLength = passLength + 1;
%             passSlotA = (1:passLength);
%             passSlot = passSlotA(end:-1:1);
%             b = 1;
%             guess = ' ';
%             guess(1:passLength) = 'a';
%             
%         end
%         
%         for i = 1:passLength
%             
%             for j = 1:alphasize
%                 guess(passSlot(i)) = alphabet(j);
%                 b = b + 1;
%                 if strcmp(guess, realpass) == 1
%                     break
%                 end
%                 
%                 
%             end
%             
%         break  
%         end
%         i = i + 1;

    counter = counter + 1;   
    end %ends while, checks guess 
end %ends if strcmp(... if match

%% Display Results

disp(['Got it.  The password is "', guess, '".']);
if counter == 1
    disp(['It took ', num2str(counter), ' guess.']);
else
    disp(['It took ', num2str(counter), ' guesses.']);
end
