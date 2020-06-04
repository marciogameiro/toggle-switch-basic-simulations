function y = H_minus(x, L, delta, theta, n)

y = L + delta * theta.^n ./ (x.^n + theta.^n);

end
