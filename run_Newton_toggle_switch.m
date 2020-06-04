set(0, 'DefaultAxesFontSize', 18)
set(0, 'DefaultAxesFontWeight', 'bold')

% Hill function parameters
gamma1 = 1; gamma2 = 1;
L1 = 1; L2 = 2;
delta1 = 0.5; delta2 = 1;
theta1 = 0.5; theta2 = 2;
n1 = 5; n2 = 5;

g = @(x) toggle_switch(x, gamma1, gamma2, L1, L2, delta1, delta2, theta1, theta2, n1, n2);
Dg = @(x) JacobianFiniteDifferences(g, x);

% x0 = [0.2; 0.3];
x0 = 10 * (-1.0 + 2.0 * rand(2, 1));

rel_tol = 1.0e-14;
abs_tol = 1.0e-14;
max_itr = 50;

[x, num_itr, converged] = Newton(g, [], x0, max_itr, rel_tol, abs_tol);
% [x, num_itr, converged] = Newton(g, Dg, x0, max_itr, rel_tol, abs_tol);

% format short e

disp(' ')

if converged == true
  disp(['Newton converged in ' num2str(num_itr) ' iterations to the solution x: '])
  disp(x')
else
  disp(['Newton did not converged after ' num2str(max_itr) ' iterations!'])
end

% Compute Jacobian matirx
J = Dg(x);

% disp(' ')
% disp(['Jacobina matrix:'])

% disp(J)

disp(' ')
disp(['Eigenvalues of Jacobina matrix:'])

disp(eig(J))
