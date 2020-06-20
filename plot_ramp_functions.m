set(0, 'DefaultAxesFontSize', 18)
set(0, 'DefaultAxesFontWeight', 'bold')

% Ramp function parameters
L = 1;
delta = 2;
theta1 = [0.5, 1.5];
theta2 = [1, 2.5];

x = 0:0.01:4;

% Evaluate ramp functions
y_minus = L_minus(x, L, delta, theta1);
y_plus = L_plus(x, L, delta, theta2);

figure; hold on;
plot(x, y_minus, 'r', 'LineWidth', 2)
plot(x, y_plus, 'b', 'LineWidth', 2)

xlabel('$$x$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$y$$', 'Interpreter', 'latex', 'FontSize', 35)
