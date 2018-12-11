%% Calls

Q2bi;

%% Parameters

f = 'frequency';
g = 'ks';
p = 10;
space = [1, 1] * 0.01;

%% Code

for i = 2:size(index, 1)
    % Compute
    whole.stats.(index{i}).(f) = frequency([ whole.sample.(index{i}) ]' * p);
    whole.stats.(index{i}).(f)(:, 1) = whole.stats.(index{i}).(f)(:, 1) / p;
    
    for j = 1:length(sub)
        sub(j).stats.(index{i}).(f) = frequency([ sub(j).sample.(index{i}) ]' * p);
        sub(j).stats.(index{i}).(f)(:, 1) = sub(j).stats.(index{i}).(f)(:, 1) / p;

        % Distance between values represented in both samples
        x = ismember(whole.stats.(index{i}).(f)(:, 1), sub(j).stats.(index{i}).(f)(:, 1));
        diff = whole.stats.(index{i}).(f)(x, 3) - sub(j).stats.(index{i}).(f)(:, 3);

        sub(j).stats.(index{i}).(g) = max(abs(diff));
    end
end

% Setup
sample = [sub.stats];

for i = 2:size(index, 1)
    temp = [sample.(index{i})];
    temp = [temp.(g)]';
    
    % Compute
    edges = min(temp):space(i - 1):max(temp);

    % Plot
    subplot(1, 2, i - 1);
    histogram(temp, edges);
    title( strcat(index{i}, {' '}, g, {' '}, 'histogram') );
    xlabel( strcat(index{i}, {' '}, g) );
    ylabel('Sub sample number');
end

%% Clear workspace

clearvars -except whole sub index;