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
    currentIndex = sub2ind(size(boardMatrix), row, col);

    for i = 2:queenNum
        [validRows, validCols] = find(boardMatrix == 1);
        validIndices = sub2ind(size(boardMatrix), validRows, validCols);

        if isempty(validIndices)
            break;
        end

        validIndices = sort(validIndices);
        nextIndex = validIndices(find(validIndices > currentIndex, 1));

        if isempty(nextIndex)
            nextIndex = validIndices(1);
        end

        [nextRow, nextCol] = ind2sub(size(boardMatrix), nextIndex);
        currentCoord = [nextRow, nextCol];

        boardMatrix(nextRow, nextCol) = 1;
        queenPositions = [queenPositions; currentCoord];

        boardMatrix = queenElim(currentCoord, boardMatrix);
        currentIndex = nextIndex;
    end

    finalBoard = boardMatrix;
end