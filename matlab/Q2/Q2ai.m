%% Calls

Q2a;

%% Parameters

f = {'mean'; 'median'; 'mode'; 'var'; 'std'};

%% Code

% Setup
sub.stats = struct;

% Compute
for i = 2:size(index, 1)
    sub.stats.(index{i}) = struct;
    for j = 1:size(f, 1)
        sub.stats.(index{i}).(f{j}) = feval(f{j}, [ sub.sample.(index{i}) ]');
    end
    
    % Displayable at tab.sub.(index{i})
    tab.sub.(index{i}) = struct2table(sub.stats.(index{i}));
end

%% Clear workspace

clearvars -except whole sub index tab;
