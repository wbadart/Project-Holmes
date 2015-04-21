function [ c, indexRange ] = hasOverlap(orig, word, nextLetter, indexRange, isFirstPass)
if nextLetter || isFirstPass
    for j = 1:length(orig)
        a = orig(j);
        a = a{:};
        if strcmp(lower(a(1)), lower(word(1)))
            j_min = j;
            break
        end
    end
    for k = j_min:length(orig)
        a = orig(k);
        a = a{:};
        if ~strcmp(lower(a(1)), lower(word(1)))
            j_max = k;
            break
        end
    end
    indexRange = [j_min, j_max];
end

for i = indexRange(1):indexRange(2)
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