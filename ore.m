function [N, Xe] = ore(equarec, N, x0, varargin)
%ORE Summary of this function goes here
%   Detailed explanation goes here
x0 = x0(:);
dim = length(x0);
duree = N(2) - N(1) + 1;
N = N(1):N(2);

Xe = zeros(duree, dim);
xe = x0;
indmatlab = 1;
for n=N
    Xe(indmatlab,:) = xe';
    xe = equarec(n, xe, varargin{:});
    indmatlab = indmatlab + 1;
end

