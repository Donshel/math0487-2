%% Parameters

n = 40;
ni = 4;
l = 100;
m = (ni + 1) * l;
f = {
    'mean', 'mean', {};
    'std', 'std', {1}
};
g = {'x', 'cf', {[], 1}};
country = 'Belgium';
p = 0.95;
tol = 0;

%% Calls

loadData;
pickSamples;

%% Compute

% Setup
alpha = 1 - p;

% Compute
for i = 1:size(index, 1)
    f{k, 3}{1} = dataset{iCountry, index{i}};
    stats.dataset.(index{i}).(f{k, 1}) = feval(f{k, 2}, dataset.(index{i}), f{k, 3}{:});
    temp = zeros(m, 1);
    for j = 1:m
        temp(j) = feval(f{k, 2}, sample{j}.(index{i}), f{k, 3}{:});
    end
    stats.sample.(index{i}).(f{k, 1}) = temp;
end

% Compute H0
for i = 1:size(index, 1)
    temp = (stats.dataset.(index{i}).(f{k, 1}) * (1 - stats.dataset.(index{i}).(f{k, 1})) / n)^(1/2);
    temp = stats.dataset.(index{i}).(f{k, 1}) + temp * icdf('Normal', 1 - alpha / 2, 0, 1);
    temp = temp >= stats.sample.(index{i}).(f{k, 1}); % for each of the #m samples

    H0.(index{i}) = table;
	H0.(index{i}).(country) = temp(1:l);
	for j = 1:ni
		H0.(index{i}).(['Institute_' num2str(j)]) = temp(1 + j * l:(1 + j) * l);
	end
    H0.(index{i}).('OMS') = sum(H0.(index{i}){:, 2:end}, 2) + tol >= ni;

    % Count
    number.(index{i}) = array2table(l - sum(H0.(index{i}){:,:}, 1));
    number.(index{i}).Properties.VariableNames = H0.(index{i}).Properties.VariableNames;
end

%% Display

for i = 1:size(index, 1)
    disp([index{i} ' :']);
    disp(number.(index{i}));
end

%% Clear workspace

clearvars -except dataset index stats H0 number;
