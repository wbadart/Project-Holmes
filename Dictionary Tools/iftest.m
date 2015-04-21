clear
clc

n_min = 10000000;
n_max = 1000000000;
j = n_min;

while (j <= n_max)
    tic;
    for i = 1:j
        if 4 == 5
            disp('null');
        end
    end
    time(j) = toc;
    j = j * 10;
end