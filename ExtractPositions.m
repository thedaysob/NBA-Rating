function pos = ExtractPositions(stat)
% function pos = ExtractPositions(stat)
% input: stat
% output: pos 
% does: given a data with all the players and their positions, this function separates
% players into 5 groups by their positions. Also, the condition for a valid player is that
% they play more than 200 minutes in the whole season

% logial vector of players who play more than 200 minutes
MP = (stat.MP > 200);
numberOfPlayers = size(stat.pos);

count = 0;

% empty vectors
pos.pgIndex = [];
pos.cIndex = [];
pos.sgIndex = [];
pos.pfIndex = [];
pos.sfIndex = [];

% extract players by position
for i = 2:numberOfPlayers
    count = count + 1;
    if (strcmp(stat.pos{i},'PG') && MP(i-1))
        pos.pgIndex = [pos.pgIndex; count];
    elseif (strcmp(stat.pos{i},'C') && MP(i-1))
        pos.cIndex = [pos.cIndex; count];
    elseif (strcmp(stat.pos{i},'SG') && MP(i-1))
        pos.sgIndex = [pos.sgIndex; count];
    elseif (strcmp(stat.pos{i},'PF') && MP(i-1))
        pos.pfIndex = [pos.pfIndex; count];
    elseif (strcmp(stat.pos{i},'SF') && MP(i-1))
        pos.sfIndex = [pos.sfIndex; count];
    end
end
end
