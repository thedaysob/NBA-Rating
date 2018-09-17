a) The main code to run is UserMain. It will take some time to run due to the big
data file that the code reads from. Once a GUI pops up, you are ready to go!
In the GUI window, you can insert the name of any player who plays in the nba.
It will give you where that nba player is located with respect to other players
who plays the same position. 

b) Functions:
CalcRsquared
input: y, yFit
output: rSquared
does: calculates the rSquared value to determine whether the two variables have
some sort of correlation.

CalculateCRating, CalculatePGRating, CalculatePFRating, CalculateSGRating, CalculateSFRating
input: Index of each position, stat
ouput: score of each player within their position
does: calculates rating of each centers in nba by weighing stats relevant to each
position

ExtractPositions
input: filename, stat
output: pos 
does: given a data with all the players and their positions, this function separates
players into 5 groups by their positions. Also, the condition for a valid player is that
they play more than 200 minutes in the whole season

GetPlayerStat
input: playerName, playerPos, handles
output: playerStat
does: given a player's name and his position, with all the stat in the struct handles, the
code will extract player's age, wage, and rating

GetPosition
input: playerName, stat
output: playerPosition
does: given a player's name it will determine if the player exists within the league and if
he does his position will be the output

GetWage
input: stat, pos, wealth
output: playerWage
does: given the data, extract all players wage by position

MyData
input: statFile, payFile
output: pos, playerWage, rating, stat
does: uses the functions written to return all the variables and struct needed to successfully
run the program

MyLinefit
input:
  x: vector x value
  y: vector function of x value
  isPlotted: Determines whether or not the graph should be plotted
output:
  yFit: fitness according to the calculations
  coeff: vector containing m and b
  rSq: percentage of variance described by the fit
does: Outputs all the solutions


PlayerRating
input: stat, pos
output: rating
does: uses all the rating calculating functions to save it into a struct

PlottingChoice
input: handles, playerName, playerPos
output: userData
does: given the playerName and his position, relevant data is extracted into the struct userData
so that valid variables are being plotted in the gui script

ReadData
input: filename, payFile
output: stat, wealth
does: extracts data given by NBAReferences and saves it in to structs to be used in my program

UserMain/gui
input:
output:
does: Connects the client using the program and the program. Makes it easy for the client to use
my program.

c)
Examples to run my code:
If you like to see where your favorite basketball resides compare to other players, type his full
name and your player will be the red dot with the blue circle around it.
Players to try
LeBron James
Kyrie Irving
Steven Adams
Anthony Davis
Kevin Durant

