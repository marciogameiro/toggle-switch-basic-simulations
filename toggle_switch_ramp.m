function y = toggle_switch_ramp(x, gamma1, gamma2, L1, L2, delta1, delta2, theta1, theta2)

y = [-gamma1 * x(1) + L_minus(x(2), L1, delta1, theta1); ...
     -gamma2 * x(2) + L_minus(x(1), L2, delta2, theta2)];

end
