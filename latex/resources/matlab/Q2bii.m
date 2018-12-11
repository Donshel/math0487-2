%% Parameters

space = [0.5, 0.2];

%% Calls

Q2b;

%% Plot

k = 2;
Q2bhist;

%% Display

for i = 1:size(index, 1)
    disp([index{i} ' :']);
    disp(tab.(index{i})(k, :));
end

%% Clear workspace

clearvars -except dataset index stats tab;
