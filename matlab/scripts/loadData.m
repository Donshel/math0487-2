% Setup
dataset = readtable('db_stat14.csv', 'ReadRowNames', true);
index = (dataset.Properties.VariableNames)';

% Compute
if exist('f', 'var') == 1 % if #f is set
    stats.dataset = struct;
    for i = 1:size(index, 1) % for each population
        stats.dataset.(index{i}) = table;
        for j = 1:size(f, 1) % for each function
            stats.dataset.(index{i}).(f{j, 1}) = feval(f{j, 2}, dataset.(index{i}), f{j, 3}{:});
        end
    end
end
