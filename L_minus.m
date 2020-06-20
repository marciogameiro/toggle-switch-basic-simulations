function y = L_minus(x, L, delta, theta)
% Decreasing linear ramp function, that is, defined by:
% y = L + delta, if x <= theta1
% y = L,         if x >= theta2
% y = line from (theta1, L + delta) to (theta2, L), otherwise

% Get theta1 and theta2
theta1 = theta(1);
theta2 = theta(2);

% The varibale x could be a vector, so need to split the
% vector into the parts x <= theta1, theta1 < x < theta2,
% and x >= theta2 to compute the function y
x1 = x(x <= theta1); % Get values x <= theta1
x2 = x((x > theta1) & (x < theta2)); % Get values theta1 < x < theta2
x3 = x(x >= theta2); % Get values x >= theta2

% Define the functions by parts: y1, y2, and y3

% Define y = L + delta for x <= theta1
if isempty(x1)
  y1 = []; % Empty if x1 is empty
else
  y1 = (L + delta) * ones(size(x1));
end

% Define y = line for theta1 < x < theta2
if isempty(x2)
  y2 = []; % Empty if x2 is empty
else
  m = delta / (theta1 - theta2); % Slope
  % Line from (theta1, L + delta) to (theta2, L)
  y2 = L + delta + m * (x2 - theta1);
end

% Define y = L for x >= theta2
if isempty(x3)
  y3 = []; % Empty if x3 is empty
else
  y3 = L * ones(size(x3));
end

% Join y1, y2, and y3
y = [y1, y2, y3];

end
