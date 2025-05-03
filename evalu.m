## Copyright (C) 2025 Zebus
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} evalu (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Zebus <Zebus@DESKTOP-D8T8531>
## Created: 2025-05-02

function retval = evalu (inputM)
  board = inputM;
  [qrow qcol] = find(inputM ==1);
  queen = sub2ind(size(board),qrow,qcol);
  nQueen = find(inputM ==0);
  board(queen) = 2;
  board(nQueen) = 1;



 for i= 1:length(queen)
 board = queenElim([qrow(i) qcol(i)], board);

 end

 retval = board;

  if ismember(2,board)

   retval = "Fail";


 else
  retval = "Pass";
 endif

endfunction
