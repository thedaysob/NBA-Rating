function pgScore = CalculatePGRating(pgIndex, stat)
% function pgScore = CalculatePGRating(pgIndex, stat)
% input: Index of each position, stat
% ouput: score of each player within their position
% does: calculates rating of each centers in nba by weighing stats relevant to each
% position
pgMP = stat.MP(pgIndex);
% stat per minute
ptsPerMin = stat.pts(pgIndex) ./ pgMP;
blkPerMin = stat.blocks(pgIndex) ./ pgMP;
astPerMin = stat.assist(pgIndex) ./ pgMP;
rbPerMin = stat.RB(pgIndex) ./ pgMP;

% calculate rating
pgScore = (rbPerMin * 10) + (astPerMin * 25) + (blkPerMin * 5) ...
    + (ptsPerMin * 20) + (stat.FT(pgIndex) * 15) ...
    + (stat.FG(pgIndex) * 25) + (stat.per(pgIndex) * 2) + ...
    (stat.trueFG(pgIndex) * 20);

pgScore = pgScore / 200;
end
