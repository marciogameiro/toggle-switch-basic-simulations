function [x1, num_itr, converged] = Newton(f, Df, x0, max_itr, rel_tol, abs_tol)
% function [x1, num_itr, converged] = Newton(f, Df, x0, max_itr, rel_tol, abs_tol)
%
% Runs Newton's method on the function f with initial condition x0
%
% Input:
% f = function that evaluates f
% Df = function to compute the Jacobian of f (optional)
% x0 = initial guess for Newton
% max_itr = Maximum number of Newton iterations
% rel_tol = Relative tolerance for Newton
% abs_tol = Absolute tolerance for Newton
%
% Output:
% x1 = solution that was computed if Newton converges
% num_itr = Number of iterations used be Newton
% converged = flag that is true if Newton converged
%
% If Df is not provided uses finite differences to
% approximate the Jacobian matrix

% If Df not provided, define it using finite differences
if isempty(Df)
  Df = @(x) JacobianFiniteDifferences(f, x);
end

x1 = x0; % Initialize x1 as the initial point x0

f_x1 = f(x1);         % Compute f at the initial point
norm_f1 = norm(f_x1); % Norm of f at the initial point

% disp(' ')
% disp(['||f(x)|| = ', num2str(norm(norm_f1))])

converged = false; % Intialize converged to false
num_itr = 0;       % Intialize iteration counter

while ((converged == false) && (num_itr < max_itr))
  x0 = x1;           % Update x0
  f_x0 = f_x1;       % Update f at x0
  norm_f0 = norm_f1; % Update norm of f at x0

  Df_x0 = Df(x0);            % Jacobian matrix at x0
  u = mldivide(Df_x0, f_x0); % Newton iteration (solve linear sistem)
  x1 = x0 - u;               % Newton iteration (compute x1)

  f_x1 = f(x1);          % Compute f at x1
  norm_f1 = norm(f_x1);  % Norm of f at x1

  % Check for convergence
  if (norm_f1 < rel_tol * norm_f0 + abs_tol)
    converged = true;
  end

  % disp(['||f(x)|| = ', num2str(norm(norm_f1))])
  % % disp(['||Df(x)|| = ', num2str(norm(inv(Df(x1, lambda))))])

  num_itr = num_itr + 1; % Increment iteration counter
end

end
