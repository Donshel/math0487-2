%% Parameters

p = 0.95;
h = 'H0';

%% Calls

Q4;

%% Compute

% Setup
alpha = (1 - p) / 2;
H0 = struct;
prop = struct;

% Compute
for i = 1:size(index, 1)
    temp = dataset{iCountry, index{i}} - stats.sample.(index{i}).mean;
    temp = temp ./ stats.sample.(index{i}).std;
	stats.sample.(index{i}).(h) = normcdf(temp) <= x.(index{i});

    H0.(index{i}) = table;
	H0.(index{i}).('state') = stats.sample.(index{i}).(h)(1:m / o);
	for j = 1:o - 1
		temp = stats.sample.(index{i}).(h)(1 + j * m / o:(j + 1) * m / o);
		H0.(index{i}).(['inst' num2str(j)]) = temp;
	end
	H0.(index{i}).oms = sum(H0.(index{i}){:, 1:o}, 2) >= o;
    prop.(index{i}) = array2table(1 - sum(H0.(index{i}){:,:}) / size(H0.(index{i}), 1));
    prop.(index{i}).Properties.VariableNames = H0.(index{i}).Properties.VariableNames;
end

%% Display

disp('H0 :');
disp(H0.(index{1}));
disp('Proportion de rejets :');
disp(prop.(index{1}));

%% Clear workspace

clearvars -except dataset index stats sample H0 prop;
