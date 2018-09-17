function [pos, playerWage, rating, stat] = MyData(statFile, advancedFile, payFile)
% function [pos, playerWage, rating, stat] = MyData(statFile, advancedFile, payFile)
% input: statFile, payFile
% output: pos, playerWage, rating, stat
% does: uses the functions written to return all the variables and struct needed to successfully
% run the program

[stat, wealth] = ReadData(statFile, advancedFile, payFile);

pos = ExtractPositions(stat);

rating = PlayerRating(stat, pos);

playerWage = GetWage(stat, pos, wealth);
end