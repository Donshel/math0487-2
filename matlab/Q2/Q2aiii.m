%% Calls

Q2ai;

%% Parameters

f = 'frequency';
g = 'ks';
p = 10;

%% Code

for i = 2:size(index, 1)
    % Compute
    whole.stats.(index{i}).(f) = frequency([ whole.sample.(index{i}) ]' * p);
    sub.stats.(index{i}).(f) = frequency([ sub.sample.(index{i}) ]' * p);
    
    whole.stats.(index{i}).(f)(:, 1) = whole.stats.(index{i}).(f)(:, 1) / p;
    sub.stats.(index{i}).(f)(:, 1) = sub.stats.(index{i}).(f)(:, 1) / p;
    
    % Distance between values represented in both samples
    x = ismember(whole.stats.(index{i}).(f)(:, 1), sub.stats.(index{i}).(f)(:, 1));
    diff = abs( whole.stats.(index{i}).(f)(x, 3) - sub.stats.(index{i}).(f)(:, 3) );
    
    sub.stats.(index{i}).(g) = max(abs(diff));
    
    % Plot
    eval(['plot' num2str(i) '= subplot(1, 2,' num2str(i) '- 1);']);
    plot(whole.stats.(index{i}).(f)(:, 1),  whole.stats.(index{i}).(f)(:, 3));
    hold on
         plot(sub.stats.(index{i}).(f)(:, 1), sub.stats.(index{i}).(f)(:, 3));
         plot(sub.stats.(index{i}).(f)(:, 1), abs(diff));
    hold off
    legend('Whole sample', 'Sub sample', 'Distance');
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

linkaxes([plot2, plot3], 'y');

%% Clear workspace

clearvars -except whole sub index;