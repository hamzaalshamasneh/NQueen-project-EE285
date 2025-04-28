#{

Author: Alina Matchette
 Created: 2025-04-27

 USAGE: for use in the N Queen problem script in the github repo <>
 - requires inputs
	- cord: 2 position coordinate array of evaluation position, the queen from the perspective of which the removal of queens from the board using subtractive methods is applied
	- board: the current board state as an NxN matrix
	- both inputs require being valid coordinates and board matrices, must have min value 1,1 and max n,n
 - outputs
	- returns updated matrix when called, after subtractive method is applied
 - dependencies: none
 - version
	1.0 - Original
#}


function queenElim = queenElim (coord, board)
localBoard = board; #casting global input to local variables as safety measure, generally redundant
posit = coord; #posit, the current positon of the program in board matrix

localBoard(posit(1),posit(2)) = 2; #isolating current position from analysis of non target
[row,col] = find(localBoard ==1); #isolating target values

vectx = row - posit(1); #create two arrays containing x and y coordinates of all queens on board in target positions, as vectors from posit
vecty = col -posit(2);

magna = sqrt(vectx.^2+vecty.^2); #creates array of magnitudes of queen vectors

anglv = acosd(vecty./(magna.*(sqrt(1)))); #finds angle between vector [0 1] and target vectors, isolating target coordinates, at 45 degree angles
anglerem = rem(anglv,45);
targets = find(anglerem <=.001); #.001 used as comparison value due to 45/45 remainder not being zero, but 7E-15

for i=1 :length(row) #checks for all of the isolated values, if they are isolated as targets, removed them from the locally stored board
 if ismember(i,targets)

  localBoard(row(i),col(i)) = 0;

  end
 end

 localBoard(posit(1),posit(2)) = 1; #unisolate current position queen so that it may be used in output, which requires queens to be specified as a 1

queenElim = localBoard; #returning locally stored board to calling script

endfunction
