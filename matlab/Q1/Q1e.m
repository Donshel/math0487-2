%% Parameters

country = 'Belgium';
supp = 20;

%% Calls

loadData;

%% Compute

% Setup
tab = table;
iCountry = find(strcmp(dataset.Properties.RowNames, country)); % search country

% Compute
temp = cf(dataset.(index{1}), supp);
tab.proportion = temp - cf(dataset.(index{1}), dataset{iCountry, index{1}});

%% Display

disp(tab);

%% Plot

for i = 1:size(index, 1)
    subplot(1, 2, i);
    cdfplot(dataset.(index{i}));
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

%% Clear workspace

clearvars -except dataset index tab;
