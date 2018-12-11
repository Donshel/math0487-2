%% Parameters

n = 20;
m = 3;
f = {
    'mean', 'mean', {};
    'median', 'median', {};
    'std', 'std', {1}
};

%% Calls

loadData;
pickSamples;

%% Display

for i = 1:size(index, 1)
    disp([index{i} ' :']);
    disp(stats.sample.(index{i}));
end

%% Clear workspace

clearvars -except dataset index stats;
