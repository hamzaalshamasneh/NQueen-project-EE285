#{
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>

 Author: Alina Matchette
 Created: 2025-04-27

 USAGE: for use in the N Queen problem script in the github repo <>
 - requries inputs
    - cord: 2 position cordiante array of evaluation position, the queen from the perspective of which the removal of queens from the board using subtractive methods is applied
    - board: the current board state as an NxN matrix
 - outputs
    - returns updated matrix when called, after subtractive method is applied
 - dependancies: none
 - version
    1.0 - Original
#}

function queenElim = queenElim (cord, board)
localBoard = board; #casting gloabal input to local veriables as safety measure, generally redundant
posit = cord; #posit, the current positon of the program in board matrix

localBoard(posit(1),posit(2)) = 2; #isolating current position from anylisis of non target
[row,col] = find(localBoard ==1); #isolating target values

vectx = row - posit(1); #create two arrays containing x and y cordinates of all queens on board in target positions, as vectors from posit
vecty = col -posit(2);

magna = sqrt(vectx.^2+vecty.^2); #creates array of magnitues of queen vectors

anglv = acosd(vecty./(magna.*(sqrt(1)))); #finds angle between vector [0 1] and target vectors, isolating target cordinates, at 45 degree angles
anglerem = rem(anglv,45);
targets = find(anglerem <=.001); #.001 used as comparison value due to 45/45 remainder not being zero, but 7E-15

for i=1 :length(row) #checks for all of the isolated values, if they are isolated as targets, removed them from the locally stored board
 if ismember(i,targets)

  localBoard(row(i),col(i)) = 0;

  end
 end

 localBoard(posit(1),posit(2)) = 1; #unisolate current position queen so that it may be used in output, which requres weens to be specified as a 1

queenElim = localBoard; #returning locally stored board to calling script

endfunction
