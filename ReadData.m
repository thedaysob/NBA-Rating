function [stat, wealth] = ReadData(statFile, advancedFile, payFile)
[stat.pts] = xlsread(statFile,'AD:AD');
[stat.MP] = xlsread(statFile,'H:H');
[~,stat.Player] = xlsread(statFile,'B:B');
[stat.age] = xlsread(statFile,'D:D');
[stat.blocks] = xlsread(statFile,'AA:AA');
[stat.assist] = xlsread(statFile,'Y:Y');
[stat.FG] = xlsread(statFile,'I:I');
[stat.FT] = xlsread(statFile,'S:S');
[stat.RB] = xlsread(statFile, 'X:X');
[~,stat.pos] = xlsread(statFile, 'C:C');

stat.per = xlsread(advancedFile, 'H:H');
stat.trueFG = xlsread(advancedFile, 'I:I');

[~,wealth.Player] = xlsread(payFile,'B:B');
wealth.pay = xlsread(payFile,'D:D');
end

