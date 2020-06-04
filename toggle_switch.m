function y = toggle_switch(x, gamma1, gamma2, L1, L2, delta1, delta2, theta1, theta2, n1, n2)

y = [-gamma1 * x(1) + H_minus(x(1), L1, delta1, theta1, n1); ...
     -gamma2 * x(2) + H_minus(x(2), L2, delta2, theta2, n2)];

end
