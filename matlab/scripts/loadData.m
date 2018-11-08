% Setup
dataset = readtable('../resources/csv/db_stat14.csv', 'ReadRowNames', true);
index = (dataset.Properties.VariableNames)';

if exist('f', 'var') == 1
    stats.dataset = struct;

    % Compute
    for i = 1:size(index, 1)
        stats.dataset.(index{i}) = table;
        for j = 1:size(f, 1)
            stats.dataset.(index{i}).(f{j}) = feval(f{j}, dataset.(index{i}));
        end
    end
end
