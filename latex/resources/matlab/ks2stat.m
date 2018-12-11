function ks2stat = ks2stat(x1, x2)
%% ks2stat

% Compute #ks2stat, the Kolmogorov-Smirnov distance between #x1 and #x2 samples.

%% Code
    [~, ~, ks2stat] = kstest2(x1, x2);
end
