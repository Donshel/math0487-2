function y = cf(Dn, x, varargin)
%% cf

% Compute #y, the cumulative frequency of #x in the population #Dn.

%% Defaults

defaults = {0};
idx = ~cellfun('isempty',varargin);
defaults(idx) = varargin(idx);

%% Code
    y = zeros(size(x));
    for i = 1:numel(x)
        if defaults{1} == 0
            temp = sum(Dn(:) <= x(i), 1);
        else
            temp = sum(Dn(:) < x(i), 1);
        end
        y(i) = temp / numel(Dn);
    end
end
