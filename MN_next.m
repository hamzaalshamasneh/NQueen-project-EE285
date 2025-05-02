function [finalBoard, queenPositions] = MN_next(startCoord, queenNum)
% Places queens on the board starting from the user’s position,
% and updates the board each time by removing invalid squares, and keep
% repeating the process until all queens are placed

    boardMatrix = ones(queenNum);
    
    row = startCoord(1);
    col = startCoord(2);
    boardMatrix(row, col) = 1;
    queenPositions = startCoord;
    
    boardMatrix = queenElim(startCoord, boardMatrix);
    
    %built in function to convert the (row, col) position of the queen into a linear index (used for circular search)
    currentIndex = sub2ind(size(boardMatrix), row, col);

    %loop to place the remaining queens, starting from the socnd queen
    for i = 2:queenNum

        %find all squares that have a value of 1
        [validRows, validCols] = find(boardMatrix == 1);

        %convert all valid positions into linear indices
        validIndices = sub2ind(size(boardMatrix), validRows, validCols);

        %exit the loop if there are no valid squares left
        if isempty(validIndices)
            break;
        end

        %sort the valid positions in ascending order (top left to bottom right)
        validIndices = sort(validIndices);

        %try to find the next square after the current one is sorted
        nextIndex = validIndices(find(validIndices > currentIndex, 1));

        %in case we’ve reached the end of the valid squares on the board, go back to the first square
        if isempty(nextIndex)
            nextIndex = validIndices(1);
        end

        %convert linear position back to row col
        [nextRow, nextCol] = ind2sub(size(boardMatrix), nextIndex);
        currentCoord = [nextRow, nextCol];

        %place a queen at the found valid square
        boardMatrix(nextRow, nextCol) = 1;

        % add the position of this queen to the list of placed queens
        queenPositions = [queenPositions; currentCoord];

        %eliminate all squares that are now threatened by the newly placed queen
        boardMatrix = queenElim(currentCoord, boardMatrix);

        %update currentIndex so that the next search continues from this new position
        currentIndex = nextIndex;
    end

    %after placing all queens (or exiting early), return the final board and queen positions
    finalBoard = boardMatrix;
end