set(0, 'DefaultAxesFontSize', 18)
set(0, 'DefaultAxesFontWeight', 'bold')

% DSGRN parameter 712
gamma = [1 1];
L = [1/2 1; 1/3 1/3];
delta = [3 3; 1 2] - L;
theta = [2 1; 1 2];

% DSGRN parameter 752
% gamma = [1 1];
% L = [1 1; 1 1];
% delta = [5 3; 5 5] - L;
% theta = [4 2; 3 5];
    
% Hill exponents
n1 = 20; n2 = 20;

% Define vector field f
f = @(x) toggle_switch_self_edges(x, gamma, L, delta, theta, n1, n2);

% Number of initial guesses for Newton
num_guess = 1000;

% Get num_guess random initial guesses
X0 = 10 * (-1.0 + 2.0 * rand(num_guess, 2));

% Parameters for Newton
rel_tol = 1.0e-14;
abs_tol = 1.0e-14;
max_itr = 50;

X = []; % Equilibria

for k = 1:num_guess
  % Get initial guess
  x0 = X0(k, :)';

  % Run Newton's method
  [x, num_itr, converged] = Newton(f, [], x0, max_itr, rel_tol, abs_tol);
  % [x, num_itr, converged] = Newton(f, Df, x0, max_itr, rel_tol, abs_tol);

  % Keep the solution if Newton converged
  if converged == true
    X = [X; x'];
  end
end

% Plot equilibria
plot(X(:, 1), X(:, 2), 'ks', 'MarkerFaceColor', 'r', 'MarkerSize', 12)

xlabel('$$x_1$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$x_2$$', 'Interpreter', 'latex', 'FontSize', 35)
