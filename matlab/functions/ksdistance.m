function ks = ksdistance(x, y)
    interval = x(:, 1);
    z = interp1(x(:, 1), x(:, 2), interval, 'linear');
    z = [z, interp1(y(:, 1), y(:, 2), interval, 'linear')];
    
    ks = max(abs(z(:, 1) - z(:, 2)));
end

