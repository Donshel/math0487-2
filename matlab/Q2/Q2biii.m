%% Calls

Q2b;

%% Parameters

f = 'std';
space = [1, 0.25] * 0.5;

%% Code

% Setup
sample = [sub.stats];

for i = 2:size(index, 1)
    temp = [sample.(index{i})];
    temp = [temp.(f)]';
    
    % Compute
    edges = floor(min(temp)):space(i - 1):ceil(max(temp));

    % Plot
    subplot(1, 2, i - 1);
    histogram(temp, edges);
    title( strcat(index{i}, {' '}, f, {' '}, 'histogram') );
    xlabel( strcat(index{i}, {' '}, f) );
    ylabel('Sub sample number');
end

%% Clear workspace

clearvars -except whole sub index;
