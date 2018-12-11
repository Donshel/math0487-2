%% Calls

Q1b;

%% Parameters

n = 2;

%% Code

for i = 2:l
    % Compute
    val = [data(:).(index{i})]' * n;
    s(i - 1).frequency = frequency(val);
    s(i - 1).frequency(:, 1) = s(i - 1).frequency(:, 1) / n;

    % Plot
    a = subplot(2,2,1 + mod(i, 2));
    bar(s(i - 1).frequency(:,1), s(i - 1).frequency(:,2));
    ylabel('Frequency');

    b = subplot(2,2,1 + 2 + mod(i, 2));
    plot(s(i - 1).frequency(:,1), s(i - 1).frequency(:,3));
    ylabel('Cumulated frequency');
    xlabel(index{i});

    linkaxes([a,b],'x')
end

%% Clear workspace

clearvars -except data index l h s;
