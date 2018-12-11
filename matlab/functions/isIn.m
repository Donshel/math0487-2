function y = isIn(x, in)

	y = zeros(size(x));

	for i = 1:numel(x)
		y(i) = x(i) >= in(1) && x(i) <= in(end);
	end
end
