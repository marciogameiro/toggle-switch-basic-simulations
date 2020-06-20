set(0, 'DefaultAxesFontSize', 18)
set(0, 'DefaultAxesFontWeight', 'bold')

% Hill function parameters
% gamma = [1 1];
% L = [1 2; 2 1];
% delta = [0.5 1; 0.5 2];
% theta = [0.5 2; 2 1];

% Parameter 712
gamma = [1 1];
L = [1/2 1; 1/3 1/3];
delta = [3 3; 1 2] - L;
theta = [2 1; 1 2];

% Parameter 752
% gamma = [1 1];
% L = [1 1; 1 1];
% delta = [5 3; 5 5] - L;
% theta = [4 2; 3 5];
    
% Hill exponents
n1 = 20; n2 = 20;
% n1 = 5; n2 = 5;

% Choose random parameter values
% gamma = 2.0 * rand(1, 2);
% L = 2.0 * rand(2, 2);
% delta = 2.0 * rand(2, 2);
% theta = 2.0 * rand(2, 2);

% Set axis grids
x1_grid = 0:0.01:6;
x2_grid = 0:0.01:6;

% Plot the toggle switch vector field

% Define a grid on the (x, y) plane
[x, y] = meshgrid(x1_grid, x2_grid);

% Evaluate the toggle switch vector field
u = -gamma(1) * x + H_minus(y, L(2,1), delta(2,1), theta(2,1), n1) .* ...
                    H_plus(x, L(1,1), delta(1,1), theta(1,1), n1);
v = -gamma(2) * y + H_minus(x, L(1,2), delta(1,2), theta(1,2), n2) .* ...
                    H_plus(y, L(2,2), delta(2,2), theta(2,2), n2);

% Get a coarser grid to plot the vector field
% The finner grid is used to plot the contours
x_c = x(1:10:end, 1:10:end);
y_c = y(1:10:end, 1:10:end);
u_c = u(1:10:end, 1:10:end);
v_c = v(1:10:end, 1:10:end);

% figure; hold on;
% quiver(x_c, y_c, u_c, v_c, 'LineWidth', 1.5) % Plot the vector field
% xlabel('$$x$$', 'Interpreter', 'latex', 'FontSize', 35)
% ylabel('$$y$$', 'Interpreter', 'latex', 'FontSize', 35)

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
