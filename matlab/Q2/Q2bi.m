%% Parameters

space = [0.5, 0.20];

%% Calls

Q2b;

%% Plot

k = 1;
Q2bhist;

%% Display

for i = 1:size(index, 1)
    disp([index{i} ' :']);
    disp(tab.(index{i})(k, :));
end

%% Clear workspace

clearvars -except dataset index stats tab;
