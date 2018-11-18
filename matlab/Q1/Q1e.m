%% Calls

loadData;

%% Plot

for i = 1:size(index, 1)
    eval(['plot' num2str(i) '= subplot(1, 2,' num2str(i) ');']);
    cdfplot(dataset.(index{i}));
    ylabel('Cumulated frequency');
    xlabel(index{i});
end

linkaxes([plot1, plot2], 'y');
ylim([0 1]);

%% Clear workspace

clearvars -except dataset index;
