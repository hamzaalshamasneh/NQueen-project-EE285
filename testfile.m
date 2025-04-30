#example test file for queenElim, with comments about how to structure a test file

fBoard = ones(8); #fake board
fPos = [5 3]; #fame M,N next result
fPos2 = [8 8];


run1 = (queenElim(fPos,fBoard));#call the actual function with sim inputs

run2 = (queenElim(fPos2,run1));#call the actual function with sim inputs
run3 = (queenElim(fPos2,run2));#call the actual function with sim inputs



disp(run1); #displaying all outputs from the sim runs
disp("break");
disp(run2);
disp("break");
disp(run3);
