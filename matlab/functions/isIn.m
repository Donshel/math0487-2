function y = isIn(x, in)
	y = (x > in(1)) .* (x <= in(end));
end