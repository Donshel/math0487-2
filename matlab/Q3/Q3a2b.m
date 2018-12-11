%% Parameters

n = 20;
m = 100;
f = {
    'mean', 'mean', {};
    'median', 'median', {}
};
g = {
    'gap', 'gap', {};
    'var', 'var', {1}
};

%% Calls

loadData;
pickSamples;

%% Comute

for i = 1:size(index, 1)
    tab.(index{i}) = table;
    g{1, 3} = {stats.dataset.(index{i}).mean}; % change @gap parameter according to the population studied
    for j = 1:size(g, 1) % for each function in #g
        temp = zeros(size(f, 1), 1);
        for k = 1:size(f, 1) % for each function in #f
            temp(k) = feval(g{j, 2}, stats.sample.(index{i}).(f{k, 1}), g{j, 3}{:});
        end
        tab.(index{i}).(g{j, 1}) = temp;
    end
    tab.(index{i}).Properties.RowNames = f(:, 1);
end

%% Display

for i = 1:size(index, 1)
    disp([index{i} ' :']);
    disp(tab.(index{i}));
end

%% Clear workspace

clearvars -except dataset index stats tab;
