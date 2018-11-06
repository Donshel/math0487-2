function out = frequency(in, precision)
    % Error
    if size(in, 2) ~= 1 || size(size(in), 2) > 2
        error('Wrong input dimension.');
    end

    % Boundary
    in = in / precision;
    e = round([min(in); max(in)]);
    if e(1) > 0
        e(1) = 0;
    elseif e(2) < 0
        e(2) = 0;
    end

    % Compute
    val = (e(1):e(2))';
    freq = zeros(size(val));
    for i = 1:size(val, 1)
         freq(i) = sum(round(in) == val(i));
    end

    val = val(logical(freq));
    freq = freq(logical(freq)) / size(in, 1);

    % return
    out = table;
    out.value = val * precision;
    out.frequency = freq;
    out.cumulated = cumsum(freq);
end
