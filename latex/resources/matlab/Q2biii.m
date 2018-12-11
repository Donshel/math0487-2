%% Parameters

space = [0.25, 0.125];

%% Calls

Q2b;

%% Plot

k = 3;
Q2bhist;

%% Display

for i = 1:size(index, 1)
    disp([index{i} ' :']);
    disp(tab.(index{i})(k, :));
end

%% Clear workspace

clearvars -except dataset index stats tab;
