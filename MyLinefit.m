function [yFit, coeff, rSq] = MyLinefit(x, y, isPlotted)
% function [yFit, coeff, rSq] = MyLinefit(x, y, isPlotted)
% input:
%   x: vector x value
%   y: vector function of x value
%   isPlotted: Determines whether or not the graph should be plotted
% output:
%   yFit: fitness according to the calculations
%   coeff: vector containing m and b
%   rSq: percentage of variance described by the fit
% does: Outputs all the solutions

% Checking for possible cause of errors
if (length(x) ~= length (y) || length(x) < 2 || length(y) < 2)
    yFit = NaN;
    coeff = NaN;
    rSq = NaN;
    return;
end

% Making sure it is a column vector
x = x(:);
y = y(:);

% Concatenating x vector
upX = [x ones(length(x),1)];

% Solving for m and b
coeff = upX\y;

% yFit
yFit = upX * coeff;

% rSq value
rSq = CalcRsquared(y, yFit);

% Plot the graph if input tells it to
if (nargin > 2 && isPlotted == 1)
    figure;
    plot(x,yFit,'b',x,y,'or');
    title(sprintf('R^2 = %0.4f',rSq));
    xlabel('Independent Variable');
    ylabel('Dependent Variable');
end
end





