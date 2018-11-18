function y = cf(Dn, x)
    y = zeros(size(x));
    for i = 1:numel(x)
        temp = sum(Dn(:) <= x(i), 1);
        y(i) = temp / numel(Dn);
    end
end

