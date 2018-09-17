function playerWage = GetWage(stat, pos, wealth)
% function playerWage = GetWage(stat, pos, wealth)
% input: stat, pos, wealth
% output: playerWage
% does: given the data, extract all players wage by position

% gets the names of all players by position
centerNames = stat.Player(pos.cIndex + 1);
pgNames = stat.Player(pos.pgIndex + 1);
sgNames = stat.Player(pos.sgIndex + 1);
pfNames = stat.Player(pos.pfIndex + 1);
sfNames = stat.Player(pos.sfIndex + 1);

% preallocation
playerWage.centerWage = zeros(length(centerNames),1);
playerWage.pgWage = zeros(length(pgNames),1);
playerWage.sgWage = zeros(length(sgNames),1);
playerWage.pfWage = zeros(length(pfNames),1);
playerWage.sfWage = zeros(length(sfNames),1);

% puts the wage into their respective vector by position and player name
for j = 1:length(wealth.Player)
    for i = 1:length(centerNames)
        if (strcmp(centerNames(i),wealth.Player(j)))
            playerWage.centerWage(i) = wealth.pay(j);
        end
    end
    for i = 1:length(pgNames)
        if (strcmp(pgNames(i),wealth.Player(j)))
            playerWage.pgWage(i) = wealth.pay(j);
        end
    end
    for i = 1:length(sgNames)
        if (strcmp(sgNames(i),wealth.Player(j)))
            playerWage.sgWage(i) = wealth.pay(j);
        end
    end
    for i = 1:length(pfNames)
        if (strcmp(pfNames(i),wealth.Player(j)))
            playerWage.pfWage(i) = wealth.pay(j);
        end
    end
    for i = 1:length(sfNames)
        if (strcmp(sfNames(i),wealth.Player(j)))
            playerWage.sfWage(i) = wealth.pay(j);
        end
    end
end

end


