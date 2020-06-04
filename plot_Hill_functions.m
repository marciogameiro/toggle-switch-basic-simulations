set(0, 'DefaultAxesFontSize', 18)
set(0, 'DefaultAxesFontWeight', 'bold')

% Hill function parameters
L = 1;
delta = 1;
theta = 0.5;
n = 20;

x = 0:0.01:1;

% Evaluate Hill functions
y_minus = H_minus(x, L, delta, theta, n);
y_plus = H_plus(x, L, delta, theta, n);

figure; hold on;
plot(x, y_minus, 'r', 'LineWidth', 2)
plot(x, y_plus, 'b', 'LineWidth', 2)

xlabel('$$x$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$y$$', 'Interpreter', 'latex', 'FontSize', 35)
