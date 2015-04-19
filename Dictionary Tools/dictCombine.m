function [ newDict ] = dictCombine(orig, addition, name, handles)
name = [name, '.txt'];

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

h = waitbar(0,'Please wait...');

disp(orig(end));
if length(addition) > length(orig)
    orig_prime = orig;
    orig = addition;
    addition = orig_prime;
end
disp(orig(end));
new = orig;
for i = 1:length(addition)
    if hasOverlap(orig, addition(i))
        new(end + 1) = addition(i);
    end
    if ~(mod(i, 500))
        disp(new(end));
        C = new.';
        fid = fopen(name, 'wt');
        fprintf(fid, '%s\n', C{:});
        fclose(fid);
        waitbar(i / length(addition));
    end
    
end

close(h);

end