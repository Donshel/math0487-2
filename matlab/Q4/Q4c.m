%% Parameters

n = 40;
ni = 5;
l = 100;
m = ni * l;
f = {
    'mean', 'mean', {};
    'std', 'std', {1};
    'std_corr', 'std', {0}
};
country = 'Belgium';
p = 0.95;
tol = 1;

%% Calls

loadData;
pickSamples;

%% Compute

% Setup
alpha = 1 - p;
iCountry = find(strcmp(dataset.Properties.RowNames, country));

H0 = struct;
proportion = struct;

% Compute
for i = 1:size(index, 1)
    % x
    temp = sum(dataset.(index{i}) < dataset{iCountry, index{i}});
	stats.dataset.(index{i}).x = temp / size(dataset, 1);

    % H0
    temp = dataset{iCountry, index{i}} - stats.sample.(index{i}).mean;
    temp = temp ./ stats.sample.(index{i}).std_corr;
	temp = cdf('Normal', temp, 0, 1) <= stats.dataset.(index{i}).x;

    H0.(index{i}) = table;
	H0.(index{i}).(country) = temp(1:l);
	for j = 1:ni - 1
		H0.(index{i}).(['Institute' num2str(j)]) = temp(1 + j * l:(1 + j) * l);
	end
	H0.(index{i}).('OMS') = sum(H0.(index{i}){:, 1:ni}, 2) + tol >= ni;
    
    proportion.(index{i}) = array2table(sum(H0.(index{i}){:,:}, 1) / l);
    proportion.(index{i}).Properties.VariableNames = H0.(index{i}).Properties.VariableNames;
end

%% Display

for i = 1:size(index, 1)
    disp([index{i} ' :']);
    disp(proportion.(index{i}));
end

%% Clear workspace

clearvars -except dataset index stats sample H0 proportion;
