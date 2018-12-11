function y = hasIn(x, in)
%% hasIn

% Return in #y, for each interval contained in #in, if #x is included or not in the interval.

%% Code
    y = (x(1) >= in(:, 1)) .* (x(1) <= in(:, end));
end
