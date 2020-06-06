set(0, 'DefaultAxesFontSize', 18)
set(0, 'DefaultAxesFontWeight', 'bold')

% Hill function parameters
gamma1 = 1; gamma2 = 1;
L1 = 1; L2 = 2;
delta1 = 0.5; delta2 = 1;
theta1 = 0.5; theta2 = 2;
n1 = 5; n2 = 7;

f = @(t, x) toggle_switch(x, gamma1, gamma2, L1, L2, delta1, delta2, theta1, theta2, n1, n2);

x1_grid = 0.5:0.1:1.5;
x2_grid = 0.5:0.1:4.5;

t_span_pos = [0, 2];
t_span_neg = [0, -0.2];

figure; hold on;

for x1 = x1_grid
  for x2 = x2_grid
    x0 = [x1; x2];

    % Solve ode forward (positive time)
    [t, y] = ode45(f, t_span_pos, x0);
    % Plot solution
    plot(y(:, 1), y(:, 2), 'b', 'LineWidth', 2)

    % Solve ode backwards (negative time)
    [t, y] = ode45(f, t_span_neg, x0);
    % Plot solution
    plot(y(:, 1), y(:, 2), 'r', 'LineWidth', 2)
  end
end

xlabel('$$x_1$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$x_2$$', 'Interpreter', 'latex', 'FontSize', 35)
