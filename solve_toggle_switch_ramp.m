set(0, 'DefaultAxesFontSize', 18)
set(0, 'DefaultAxesFontWeight', 'bold')

% Ramp function parameters
gamma1 = 1; gamma2 = 1;
L1 = 1; L2 = 1;
delta1 = 1; delta2 = 1;
theta1 = [0.5, 1];
theta2 = [0.5, 1.5];

f = @(t, x) toggle_switch_ramp(x, gamma1, gamma2, L1, L2, delta1, delta2, theta1, theta2);

t_span_pos = [0, 3];
t_span_neg = [0, -0.2];

x0 = [0.2; 0.3];

% Solve ode forward (positive time)
[t1, y1] = ode45(f, t_span_pos, x0);

% Solve ode backwards (negative time)
[t2, y2] = ode45(f, t_span_neg, x0);

figure; hold on;

% Plot solutions
plot(y1(:, 1), y1(:, 2), 'b', 'LineWidth', 2)
plot(y2(:, 1), y2(:, 2), 'r', 'LineWidth', 2)

xlabel('$$x_1$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$x_2$$', 'Interpreter', 'latex', 'FontSize', 35)

figure; hold on;

% Plot solutions
plot(t1, y1(:, 1), 'b-', 'LineWidth', 2)
plot(t1, y1(:, 2), 'b.-', 'LineWidth', 2)
plot(t2, y2(:, 1), 'r-', 'LineWidth', 2)
plot(t2, y2(:, 2), 'r.-', 'LineWidth', 2)

xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$x$$', 'Interpreter', 'latex', 'FontSize', 35)
