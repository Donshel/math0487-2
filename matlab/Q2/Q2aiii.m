%% Calls

Q2ai;

%% Parameters

n = 10;

%% Code

for i = 2:l
    % Setup
    val = [data(:).(index{i})]' * n;
    val_sub = [data_sub(:).(index{i})]' * n;
    
    % Compute
    s(i - 1).frequency = frequency(val);
    s_sub(i - 1).frequency = frequency(val_sub);
    
    s(i - 1).frequency(:, 1) = s(i - 1).frequency(:, 1) / n;
    s_sub(i - 1).frequency(:, 1) = s_sub(i - 1).frequency(:, 1) / n;
    
    x = ismember(s(i - 1).frequency(:, 1), s_sub(i - 1).frequency(:, 1));
    distance = abs(s(i - 1).frequency(x, 3) - s_sub(i - 1).frequency(:, 3));
    
    [ks, ind] = max(distance);
    s_sub(i - 1).ks = [s_sub(i - 1).frequency(ind,1), ks];
    
    % Plot
    subplot(2,1,i - 1);
    plot(s(i - 1).frequency(:,1), s(i - 1).frequency(:,3));
    hold on
         plot(s_sub(i - 1).frequency(:,1), s_sub(i - 1).frequency(:,3));
         plot(s_sub(i - 1).frequency(:,1), distance);
    hold off
    legend('Population', 'Sample', 'Distance');
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

%% Clear workspace

clearvars -except data data_sub index l h s s_sub;