function y = H_plus(x, L, delta, theta, n)

y = L + delta * x.^n ./ (x.^n + theta.^n);

end
