function playerStat = GetPlayerStat(playerName, playerPos, handles)
% function playerStat = GetPlayerStat(playerName, playerPos, handles)
% input: playerName, playerPos, handles(all the stats accumulated)
% output: playerStat
% does: given a player's name and his position, with all the stat in the struct handles, the
% code will extract player's age, wage, and rating

% finds the index where the player resides in the vector of player names
for i = 1:length(handles.stat.Player)
    if strcmp(strtok(handles.stat.Player(i),'\'), playerName)
        count = i;
        break
    end
end
playerStat.age = handles.stat.age(count - 1);

% pulls out stat of the player's position
if strcmp(playerPos, 'C')
    index = find(handles.pos.cIndex == (count - 1)); 
    playerStat.rating = handles.rating.cRat(index);
    playerStat.wage = handles.playerWage.centerWage(index);
elseif strcmp(playerPos, 'PG')
    index = find(handles.pos.pgIndex == (count - 1)); 
    playerStat.rating = handles.rating.pgRat(index);
    playerStat.wage = handles.playerWage.pgWage(index);
elseif strcmp(playerPos, 'SG')
    index = find(handles.pos.sgIndex == (count - 1)); 
    playerStat.rating = handles.rating.sgRat(index);
    playerStat.wage = handles.playerWage.sgWage(index);
elseif strcmp(playerPos, 'PF')
    index = find(handles.pos.pfIndex == (count - 1)); 
    playerStat.rating = handles.rating.pfRat(index);
    playerStat.wage = handles.playerWage.pfWage(index);
elseif strcmp(playerPos, 'SF')
    index = find(handles.pos.sfIndex == (count - 1)); 
    playerStat.rating = handles.rating.sfRat(index);
    playerStat.wage = handles.playerWage.sfWage(index);
end


end

