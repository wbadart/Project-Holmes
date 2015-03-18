% pauseTester.m

% Plots the true duration of a 0.00000001 second pause.


iterations = 10000;

for i = 1:iterations
    tic;
    pause(0.00000001);
    y(i) = toc;
end

x = linspace(0, iterations, iterations);
avg = sum(y) / iterations;

plot(x, y,...
    [1 iterations], [avg avg], 'r');
text(40, 0.0025, ['avg = ', num2str(avg)]);
grid on;