set(0, 'DefaultAxesFontSize', 18)
set(0, 'DefaultAxesFontWeight', 'bold')

% Hill function parameters
% gamma1 = 1; gamma2 = 1;
% L1 = 1; L2 = 2;
% delta1 = 0.5; delta2 = 1;
% theta1 = 0.5; theta2 = 2;

% Hill exponents
n1 = 5; n2 = 5;

% Choose random parameter values
params = 2.0 * rand(8, 1);
gamma1 = params(1); gamma2 = params(2);
L1 = params(3); L2 = params(4);
delta1 = params(5); delta2 = params(6);
theta1 = params(7); theta2 = params(8);

% Set axis grids
x1_grid = 0:0.01:6;
x2_grid = 0:0.01:6;

% Plot the toggle switch vector field

% Define a grid on the (x, y) plane
[x, y] = meshgrid(x1_grid, x2_grid);

% Evaluate the toggle switch vector field
u = - gamma1 * x + H_minus(y, L1, delta1, theta1, n1);
v = - gamma2 * y + H_minus(x, L2, delta2, theta2, n2);

% Get a coarser grid to plot the vector field
% The finner grid is used to plot the contours
x_c = x(1:10:end, 1:10:end);
y_c = y(1:10:end, 1:10:end);
u_c = u(1:10:end, 1:10:end);
v_c = v(1:10:end, 1:10:end);

figure; hold on;
quiver(x_c, y_c, u_c, v_c, 'LineWidth', 1.5) % Plot the vector field
% quiver(x, y, u, v, 'LineWidth', 1.5) % Plot the vector field

xlabel('$$x$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$y$$', 'Interpreter', 'latex', 'FontSize', 35)

% Next we plot the vector field and contour curves
% of the norm squared of the vector field (u, v)
z = u .^ 2 + v .^ 2; % Compute ||(u,v)||^2

num_contours = 50; % Number of contour values to plot

figure; hold on;
contour(x, y, z, num_contours, 'LineWidth', 2) % Plot contour curves of z
quiver(x_c, y_c, u_c, v_c, 'LineWidth', 1.5) % Plot the vector field
% quiver(x, y, u, v, 'LineWidth', 1.5) % Plot the vector field

% Add colorbar
colorbar

xlabel('$$x$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$y$$', 'Interpreter', 'latex', 'FontSize', 35)
