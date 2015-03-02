function [ password ] = generator( alphabet, passLength )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

for i = 1:passLength
    password(i) = alphabet(randi(length(alphabet)));
end

end

