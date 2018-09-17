function pfScore = CalculatePFRating(pfIndex, stat)
% function pfScore = CalculatePFRating(pfIndex, stat)
% input: Index of each position, stat
% ouput: score of each player within their position
% does: calculates rating of each centers in nba by weighing stats relevant to each
% position

pfMP = stat.MP(pfIndex);
% stat per minute
ptsPerMin = stat.pts(pfIndex) ./ pfMP;
blkPerMin = stat.blocks(pfIndex) ./ pfMP;
astPerMin = stat.assist(pfIndex) ./ pfMP;
rbPerMin = stat.RB(pfIndex) ./ pfMP;

% calculate rating
pfScore = (rbPerMin * 25) + (astPerMin * 10) + (blkPerMin * 10) ...
    + (ptsPerMin * 25) + (stat.FT(pfIndex) * 15) ...
    + (stat.FG(pfIndex) * 25) + (stat.per(pfIndex) * 2) + ...
    (stat.trueFG(pfIndex) * 15);

pfScore = pfScore / 250;
end
