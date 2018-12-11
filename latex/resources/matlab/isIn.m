function y = isIn(x, in)
%% isIn

% Return in #y, for each value contained in #x, if the value is included or not in the interval #in.

%% Code
	y = (x >= in(1)) .* (x <= in(end));
end
