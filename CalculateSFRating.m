function sfScore = CalculateSFRating(sfIndex, stat)
% function sfScore = CalculateSFRating(sfIndex, stat)
% input: Index of each position, stat
% ouput: score of each player within their position
% does: calculates rating of each centers in nba by weighing stats relevant to each
% position
centersMP = stat.MP(sfIndex);
% stat per minute
ptsPerMin = stat.pts(sfIndex) ./ centersMP;
blkPerMin = stat.blocks(sfIndex) ./ centersMP;
astPerMin = stat.assist(sfIndex) ./ centersMP;
rbPerMin = stat.RB(sfIndex) ./ centersMP;

% calculate rating
sfScore = (rbPerMin * 15) + (astPerMin * 15) + (blkPerMin * 10) ...
    + (ptsPerMin * 25) + (stat.FT(sfIndex) * 15) ...
    + (stat.FG(sfIndex) * 20) + (stat.per(sfIndex) * 2) + ...
    (stat.trueFG(sfIndex) * 15);

sfScore = sfScore / 250;
end
