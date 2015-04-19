function [ newDict ] = dictCombine(orig, addition)

filename = orig;
delimiter = '';
formatSpec = '%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
orig = dataArray{:, 1};
clearvars filename delimiter formatSpec fileID dataArray ans;

filename = addition;
delimiter = '';
formatSpec = '%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
addition = dataArray{:, 1};
clearvars filename delimiter formatSpec fileID dataArray ans;

disp(orig(end));
if length(addition) > length(orig)
    orig = orig_prime;
    orig = addition;
    addition = orig_prime;
end
disp(orig(end));

for i = 1:length(addition)
    if hasOverlap(orig, addition(i))
        orig(end + 1) = addition(i);
    end
    if ~(mod(i,1000))
        disp(orig(end));
        C = orig.';
        fid = fopen('file.txt', 'wt');
        fprintf(fid, '%s\n', C{:});
        fclose(fid);
    end
    
end

newDict = orig;

end