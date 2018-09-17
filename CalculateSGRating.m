function sgScore = CalculateSGRating(sgIndex, stat)
% function sgScore = CalculateSGRating(sgIndex, stat)
% input: Index of each position, stat
% ouput: score of each player within their position
% does: calculates rating of each centers in nba by weighing stats relevant to each
% position

sgMP = stat.MP(sgIndex);
% stat per minute
ptsPerMin = stat.pts(sgIndex) ./ sgMP;
blkPerMin = stat.blocks(sgIndex) ./ sgMP;
astPerMin = stat.assist(sgIndex) ./ sgMP;
rbPerMin = stat.RB(sgIndex) ./ sgMP;

% calculate rating
sgScore = (rbPerMin * 10) + (astPerMin * 15) + (blkPerMin * 5) ...
    + (ptsPerMin * 30) + (stat.FT(sgIndex) * 15) ...
    + (stat.FG(sgIndex) * 20) + (stat.per(sgIndex) * 2) + ...
    (stat.trueFG(sgIndex) * 25);

sgScore = sgScore / 250;
end
