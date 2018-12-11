%% Calls

run('..\Q1\Q1b');

%% Parameters

% Compute
f = {'mean'; 'median'; 'mode'; 'var'; 'std'};
n = 20;
m = 500;

%% Code

% Setup
sub = struct;
for i = 1:m
    sub(i).sample = whole.sample( randi([1 whole.n], n, 1) );
    sub(i).n = n;
    sub(i).stats = struct;
    
    % Compute
    for j = 2:size(index, 1)
        sub(i).stats.(index{j}).index = index{j};
        for k = 1:size(f, 1)
            sub(i).stats.(index{j}).(f{k}) = feval(f{k}, [ sub(i).sample.(index{j}) ]');
        end
    end
end