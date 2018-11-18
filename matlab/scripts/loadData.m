% Setup
dataset = readtable('../resources/csv/db_stat14.csv', 'ReadRowNames', true);
index = (dataset.Properties.VariableNames)';

if exist('f', 'var') == 1
    stats.dataset = struct;

    % Compute
    for i = 1:size(index, 1)
        stats.dataset.(index{i}) = table;
        for j = 1:size(f, 1)
            stats.dataset.(index{i}).(f{j, 1}) = feval(f{j, 2}, dataset.(index{i}), f{j, 3}{:});
        end
    end
end
