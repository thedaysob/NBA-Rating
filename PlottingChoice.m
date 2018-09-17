function userData = PlottingChoice(handles, playerName, playerPos)
% function userData = PlottingChoice(handles, playerName, playerPos)
% input: handles, playerName, playerPos
% ouput: userData
% does: given the player position, the function extracts all the relevant 
% data to be plotted in the main gui function

% Condition to check which data to extract depending on the position
if strcmp('C',playerPos)
    userData.age = handles.stat.age(handles.pos.cIndex);
    userData.rat = handles.rating.cRat;
    userData.wage = handles.playerWage.centerWage;
    userData.players = handles.stat.Player(handles.pos.cIndex + 1);
elseif strcmp('SG',playerPos)
    userData.age = handles.stat.age(handles.pos.sgIndex);
    userData.rat = handles.rating.sgRat;
    userData.wage = handles.playerWage.sgWage;
    userData.players = handles.stat.Player(handles.pos.sgIndex + 1);
elseif strcmp('PG',playerPos)
    userData.age = handles.stat.age(handles.pos.pgIndex);
    userData.rat = handles.rating.pgRat;
    userData.wage = handles.playerWage.pgWage;
    userData.players = handles.stat.Player(handles.pos.pgIndex + 1);
elseif strcmp('PF',playerPos)
    userData.age = handles.stat.age(handles.pos.pfIndex);
    userData.rat = handles.rating.pfRat;
    userData.wage = handles.playerWage.pfWage;
    userData.players = handles.stat.Player(handles.pos.pfIndex + 1);
elseif strcmp('SF',playerPos)
    userData.age = handles.stat.age(handles.pos.sfIndex);
    userData.rat = handles.rating.sfRat;
    userData.wage = handles.playerWage.sfWage;
    userData.players = handles.stat.Player(handles.pos.sfIndex + 1);
end
end