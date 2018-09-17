function centerScore = CalculateCRating(centerIndex, stat)
% function centerScore = CalculateCRating(centerIndex, stat)
% input: Index of each position, stat
% ouput: score of each player within their position
% does: calculates rating of each centers in nba by weighing stats relevant
% to each position

centersMP = stat.MP(centerIndex);

% Stat by every minute
ptsPerMin = stat.pts(centerIndex) ./ centersMP;
blkPerMin = stat.blocks(centerIndex) ./ centersMP;
astPerMin = stat.assist(centerIndex) ./ centersMP;
rbPerMin = stat.RB(centerIndex) ./ centersMP;

% Calculating center rating
centerScore = (rbPerMin * 25) + (astPerMin * 5) + (blkPerMin * 15) ...
    + (ptsPerMin * 20) + (stat.FT(centerIndex) * 15) ...
    + (stat.FG(centerIndex) * 25) + (stat.per(centerIndex) * 2) + ...
    (stat.trueFG(centerIndex) * 10);

centerScore = centerScore / 250;
end



