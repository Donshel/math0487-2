%% Calls

run('..\scripts\addPath');
loadWhole;

%% Parameters

f = {'mean'; 'median'; 'mode'; 'var'; 'std'};

%% Code

% Setup
whole.stats = struct;
tab = struct;

% Compute
for i = 2:size(index, 1)
    whole.stats.(index{i}) = struct;
    for j = 1:size(f, 1)
        whole.stats.(index{i}).(f{j}) = feval(f{j}, [ whole.sample.(index{i}) ]');
    end
    
    % Displayable at tab.whole.(index{i})
    tab.whole.(index{i}) = struct2table(whole.stats.(index{i}));
end

%% Clear workspace

clearvars -except whole index tab;
