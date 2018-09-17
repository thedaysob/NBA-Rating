function playerPosition = GetPosition(playerName, stat)
% function playerPosition = GetPosition(playerName, stat)
% input: playerName, stat
% output: playerPosition
% does: given a player's name it will determine if the player exists within the league and if
% he does his position will be the output

% finds out the position of the player
for i = 1:length(stat.Player)
    if strcmp(strtok(stat.Player(i),'\'), playerName)
        playerPosition = stat.pos(i);
        return;
    end
end
playerPosition = 'Player Not Found';

end
