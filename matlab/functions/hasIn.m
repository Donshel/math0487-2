function y = hasIn(x, in)
    y = (x(1) >= in(:, 1)) .* (x(1) <= in(:, end));
end