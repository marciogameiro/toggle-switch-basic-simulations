set(0, 'DefaultAxesFontSize', 18)
set(0, 'DefaultAxesFontWeight', 'bold')

% Hill function parameters
gamma1 = 1; gamma2 = 1;
L1 = 1; L2 = 1;
delta1 = 1; delta2 = 1;
theta1 = 0.5; theta2 = 0.5;
n1 = 5; n2 = 5;

f = @(t, x) toggle_switch(x, gamma1, gamma2, L1, L2, delta1, delta2, theta1, theta2, n1, n2);

t_span_pos = [0, 3];
t_span_neg = [0, -0.2];

x0 = [0.2; 0.3];

figure; hold on;

% Solve ode forward (positive time)
[t, y] = ode45(f, t_span_pos, x0);

% Plot solution
plot(y(:, 1), y(:, 2), 'b', 'LineWidth', 2)
% plot(t, y(:, 1), 'b-', 'LineWidth', 2)
% plot(t, y(:, 2), 'b.-', 'LineWidth', 2)

% Solve ode backwards (negative time)
[t, y] = ode45(f, t_span_neg, x0);

% Plot solution
plot(y(:, 1), y(:, 2), 'r', 'LineWidth', 2)
% plot(t, y(:, 1), 'r-', 'LineWidth', 2)
% plot(t, y(:, 2), 'r.-', 'LineWidth', 2)

xlabel('$$x_1$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$x_2$$', 'Interpreter', 'latex', 'FontSize', 35)
% xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', 35)
% ylabel('$$x$$', 'Interpreter', 'latex', 'FontSize', 35)
