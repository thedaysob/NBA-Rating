function rSquared = CalcRsquared(y,yfit)
% function rSquared = CalcRsquared(y,yfit)
% input:
%   y: data
%   yFit: fit curve
% output:
%   rSquared: percentage of variance described by the fit
% does: calculates rSquared

% Checks condition to calculate for rSquared
if (length(y) ~= length(yfit)) 
    rSquared = NaN;
    return;
end

% Makes sure the inputs are column vectors
y = y(:);
yfit = yfit(:);

% Caculated rSquared
yAverage = mean(y);
ssTotal = sum((y - yAverage).^2);
ssRes = sum((y - yfit).^2);

rSquared = 1 - (ssRes/ssTotal);

end


