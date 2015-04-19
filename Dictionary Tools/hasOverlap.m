function [ c ] = hasOverlap(orig, word)

word = word{:};

for i = 1:length(orig)
    a = orig(i);
    a = a{:};
    if strcmp(a, word)
        c = false;
        break
    else
        c = true;
    end
end


end